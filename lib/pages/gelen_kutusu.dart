import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:version1/models/konusma.dart';
import 'package:version1/models/mesaj.dart';
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
              /* print(tumKonusmalar); */

              return ListView.builder(
                  itemCount: tumKonusmalar!.length,
                  itemBuilder: (context, index) {
                    var oankiKonusma = tumKonusmalar[index];
                    return ListTile(
                      title: Text(oankiKonusma.konusulanUserName!),
                    );
                  });
            }
          },
        ));
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
      print("if true" + tekKonusma.toString());
      Konusma _tekKonusma = Konusma.fromMap(tekKonusma.data()!);

      tumKonusmalar.add(_tekKonusma);
    } else {
      print("if false" + tekKonusma.toString());
    }
  }
  return tumKonusmalar;
}
