import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:version1/models/konusma.dart';
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
          title: Text('Gelen Kutusu'),
        ),
        body: FutureBuilder<List<Konusma>>(
          future: getAllConversations(_userModel.id!),
          builder: (context, konusmaListesi) {
            if (!konusmaListesi.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var tumKonusmalar = konusmaListesi.data;
              return ListView.builder(
                  itemCount: tumKonusmalar!.length,
                  itemBuilder: (context, index) {
                    var oankiKonusma = tumKonusmalar[index];
                    return ListTile(
                      title: Text(oankiKonusma.konusulanUserName),
                    );
                  });
            }
          },
        ));
  }
}

void _konusmalarimiGetir() async {
  final _userModel = AuthService();
  var konusmalarim = await FirebaseFirestore.instance
      .collection("konusmalar")
      .where("konusma_sahibi", isEqualTo: _userModel.user?.id)
      .orderBy("olusturulma_tarihi", descending: true)
      .get();
}

Future<List<Konusma>> getAllConversations(String userID) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection("konusmalar")
      .where("konusma_sahibi", isEqualTo: userID)
      .orderBy("olusturulma_tarihi", descending: true)
      .get();

  List<Konusma> tumKonusmalar = [];

  for (DocumentSnapshot tekKonusma in querySnapshot.docs) {
    Konusma _tekKonusma = Konusma.fromMap(tekKonusma.data);
    tumKonusmalar.add(_tekKonusma);
  }
  return tumKonusmalar;
}