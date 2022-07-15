import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:version1/models/user.dart';
import 'package:version1/pages/bilgilerim.dart';
import 'package:version1/services/auth_service.dart';
import 'package:version1/services/search_service.dart';

// ignore: camel_case_types
class Results extends StatefulWidget {
  final String il;
  final String ilce;
  final String brans;
  final String mevki;
  const Results(
      {Key? key,
      required this.brans,
      required this.il,
      required this.ilce,
      required this.mevki})
      : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

// ignore: camel_case_types
class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arama Sonuçları'),
        actions: const <Widget>[],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: SearchService()
            .searchStream(widget.il, widget.ilce, widget.brans, widget.mevki),
        builder: (c, snap) {
          if (snap.hasData) {
            List<MyUser> users =
                snap.data!.docs.map((e) => MyUser.fromMap(e.data())).toList();

            if (users.length == 1) {
              if (users.any((e) => e.id == AuthService().user!.id)) {
                return const Text("Sadece Siz Varsınız");
              }
            }
            users.removeWhere((e) => e.id == AuthService().user!.id);

            return SingleChildScrollView(
              child: Column(
                children: users.map((e) {
                  return ListTile(
                    title: Text(e.userName ?? ""),
                    leading: CircleAvatar(
                      child: Text(
                        e.yas.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    subtitle:
                        Text("${e.il}, ${e.ilce}, ${e.brans}, ${e.mevki},"),
                    trailing: const Icon(Icons.message),
                    onTap: () {},
                  );
                }).toList(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
