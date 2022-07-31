// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:version1/services/auth_service.dart';
import '../models/mesaj.dart';
import '../models/user.dart';

class Sohbet extends StatefulWidget {
  final MyUser currentUser;
  late MyUser konusulanUser;
  Sohbet({
    required this.currentUser,
    required this.konusulanUser,
  });

  @override
  State<Sohbet> createState() => _SohbetState();
}

var _mesajController = TextEditingController();
ScrollController _scrollController = ScrollController();

class _SohbetState extends State<Sohbet> {
  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Color.fromARGB(255, 129, 152, 192),

        appBar: AppBar(
          elevation: 1,
          title: Text('Sohbet ${(widget.konusulanUser.userName!)} '),
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
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          return _konusmaBalonuOlustur(tumMesajar![index]);
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
                        backgroundColor: Colors.green,
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
                              _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 40),
                                  curve: Curves.easeOut);
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

  Widget _konusmaBalonuOlustur(Mesaj oankiMesaj) {
    Color _gelenMesajRenk = Colors.green;
    Color _gidenMesajRenk = Theme.of(context).primaryColor;
    var _saatDakikaDegeri = "";
    try {
      _saatDakikaDegeri = _saatDakikaGoster(oankiMesaj.date ?? Timestamp(1, 1));
    } catch (e) {
      print("Gecikme Hatası" + e.toString());
    }
    var _benimMesajimMi = oankiMesaj.bendenMi;
    if (_benimMesajimMi) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: _gidenMesajRenk,
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(4),
                    child: Text(
                      oankiMesaj.mesaj,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(_saatDakikaDegeri),
              ],
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(widget.currentUser.userName![0]),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: _gelenMesajRenk,
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(4),
                    child: Text(oankiMesaj.mesaj),
                  ),
                ),
                Text(_saatDakikaDegeri),
              ],
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      );
    }
  }

  String _saatDakikaGoster(Timestamp? date) {
    var _formater = DateFormat.Hm();
    var _formatlanmisTarih = _formater.format(date!.toDate());
    return _formatlanmisTarih;
  }
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
