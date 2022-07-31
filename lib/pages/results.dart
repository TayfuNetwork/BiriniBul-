import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:version1/models/user.dart';
import 'package:version1/pages/gelen_kutusu.dart';
import 'package:version1/pages/konusmalarim.dart';
import 'package:version1/services/auth_service.dart';
import 'package:version1/services/search_service.dart';

// ignore: camel_case_types
class Results extends StatefulWidget {
  final String il;
  final String ilce;
  final String brans;
  final String mevki;
  Results(
      {Key? key,
      required this.ppColor,
      required this.brans,
      required this.il,
      required this.ilce,
      required this.mevki})
      : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
  Color ppColor;
}

// ignore: camel_case_types
class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arama Sonuçları'),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: _mesajlaraGit,
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 6),
            ]),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: SearchService()
              .searchStream(widget.il, widget.ilce, widget.brans, widget.mevki),
          builder: (c, snap) {
            if (snap.hasData) {
              List<MyUser> users =
                  snap.data!.docs.map((e) => MyUser.fromMap(e.data())).toList();

              if (users.length == 1) {
                if (users.any((e) => e.id == AuthService().user!.id)) {
                  return const Center(
                    child: Text(
                        "Malesef, bu kriterlerdeki tek sprocumuz sizsiniz"),
                  );
                }
              }

              if (users.length == 0) {
                return Center(
                  child: Container(
                    child: const Text(
                        "Malesef, bu kriterlere uygun bir sonuç yok"),
                  ),
                );
              }
              users.removeWhere((e) => e.id == AuthService().user!.id);

              return SingleChildScrollView(
                child: Column(
                  
                  children: users.map((e) {
                    if (e.sex == 'Kadın') {
                      widget.ppColor = Colors.pink.shade400;
                    } else {
                      widget.ppColor = Colors.blue;
                    }
                    return ListTile(
                      title: Text(
                        e.userName ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: CircleAvatar(
                        child: Text(
                          e.yas.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        backgroundColor: widget.ppColor,
                      ),
                      subtitle: Text(
                        "${e.il}, ${e.ilce}, ${e.brans}, ${e.mevki}",
                      ),
                      trailing: const Icon(Icons.message),
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => Sohbet(
                                  currentUser: AuthService().user!,
                                  konusulanUser: e,
                                )));
                      },
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
      ),
    );
  }

  _mesajlaraGit() {
    return Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => Inbox()));
  }
}
