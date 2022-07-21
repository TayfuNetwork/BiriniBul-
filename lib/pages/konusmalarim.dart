// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:version1/services/auth_service.dart';
import '../models/mesaj.dart';
import '../models/user.dart';

class Konusma extends StatefulWidget {
  final MyUser currentUser;
  final MyUser konusulanUser;
  Konusma({
    required this.currentUser,
    required this.konusulanUser,
  });

  @override
  State<Konusma> createState() => _KonusmaState();
}
var _mesajController = TextEditingController();

class _KonusmaState extends State<Konusma> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Mesajlaşma + ${(widget.konusulanUser.userName!)} '),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<List<Mesaj>>(
                  stream: getMessages(
                      widget.currentUser.id!, widget.konusulanUser.id!),
                  builder: (context, StreamMesajlarlistesi) {
                    if (!StreamMesajlarlistesi.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<Mesaj>? tumMesajar = StreamMesajlarlistesi.data;
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(tumMesajar![index].mesaj);
                        },
                  
                        itemCount: tumMesajar?.length);
                  },

                ),
                
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _mesajController,
                        cursorColor: Colors.blueGrey,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Mesajınızı yazın',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.blue,
                        child: const Icon(
                          Icons.navigation,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          if (_mesajController.text.trim().length > 0) {
                            Mesaj _kaydedilecekMesaj = Mesaj(
                              kimden: widget.currentUser.id!,
                              kime: widget.konusulanUser.id!,
                              bendenMi: true,
                              mesaj: _mesajController.text,
                            );
                            var sonuc = await AuthService.saveMessage(
                                _kaydedilecekMesaj);

                            if (sonuc) {
                              _mesajController.clear();
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

Stream<List<Mesaj>> getMessages(String currentUserID, String konusulanUserID) {
  var snapShot = FirebaseFirestore.instance
      .collection("konusmalar")
      .doc(currentUserID + "--" + konusulanUserID)
      .collection("mesajlar")
      .orderBy("date")
      .snapshots();
  return snapShot.map((mesajListesi) =>
      mesajListesi.docs.map((mesaj) => Mesaj.fromMap(mesaj.data())).toList());
}
