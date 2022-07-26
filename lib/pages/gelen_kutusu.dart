import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/widgets.dart';
import 'package:intl/intl.dart';
import 'package:version1/models/konusma.dart';
import 'package:version1/models/user.dart';
import 'package:version1/pages/konusmalarim.dart';
import 'package:version1/services/auth_service.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    var _userModel = AuthService().user!;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gelen Kutusu'),
        ),
        body: FutureBuilder<List<Konusma>>(
          future: getAllConversations(_userModel.id!),
          builder: (context, konusmaListesi) {
            if (!konusmaListesi.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var tumKonusmalar = konusmaListesi.data!;
              var _saatDakikaDegeri = "";

              return RefreshIndicator(
                onRefresh: _konusmalariYenile,
                child: GestureDetector(
                  child: ListView.builder(
                      itemCount: tumKonusmalar.length,
                      itemBuilder: (context, index) {
                        var oankiKonusma = tumKonusmalar[index];
                        _saatDakikaDegeri =
                            _saatDakikaGoster(oankiKonusma.olusturulma_tarihi!);
                        return ListTile(
                          title: Text(oankiKonusma.son_yollanan_mesaj! +
                              "  " +
                              _saatDakikaDegeri),
                          subtitle: const Text('Konusma Sahibi'),
                          leading:
                              const CircleAvatar(backgroundColor: Colors.black),
                          onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => Sohbet(
                                currentUser: AuthService().user!,
                                konusulanUser: MyUser.idveResim(
                                    id: oankiKonusma.kimle_konusuyor),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              );
            }
          },
        ));
  }

  String _saatDakikaGoster(Timestamp? date) {
    var _formater = DateFormat.Hm();
    var _formatlanmisTarih = _formater.format(date!.toDate());
    return _formatlanmisTarih;
  }

  Future<Null> _konusmalariYenile() async {
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    return null;
  }
}

Future<List<Konusma>> getAllConversations(String userID) async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection("konusmalar")
      .where("konusma_sahibi", isEqualTo: userID)
      .orderBy("olusturulma_tarihi", descending: true)
      .get();

  List<Konusma> tumKonusmalar = [];

  for (DocumentSnapshot<Map<String, dynamic>> tekKonusma
      in querySnapshot.docs) {
    if (tekKonusma.data() != null) {
      Konusma _tekKonusma = Konusma.fromMap(tekKonusma.data()!);

      tumKonusmalar.add(_tekKonusma);
    }
  }
  return tumKonusmalar;
}
