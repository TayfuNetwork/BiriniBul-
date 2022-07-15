// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:version1/pages/bilgilerim.dart';
import 'package:version1/pages/sign_in_page.dart';

import '../control_pages/json-models.dart';
import 'db.dart';

// ignore: camel_case_types

class profile extends StatefulWidget {
  const profile({
    Key? key,
  }) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

String? ad, soyad, yasi;




class _profileState extends State<profile> {
  Brans? brans;
  String? mevki;
  BransServices model = BransServices();
  Il? il;
  String? ilce;
  IlService service = IlService();
  int yas = 0;
  String? isim;
  String? soyisim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profil'),
        actions: <Widget>[
          TextButton(
            onPressed: _cikisYap,
            child: const Text(
              'Çıkış Yap',
              style: TextStyle(color: (Colors.red)),
            ),
          )
        ],
      ),
//******************************************************************//
      body: SingleChildScrollView(
          child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 6),
            ]),
//******************************************************************//

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('DIKKAT !! Bilgiler değiştirilemez',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            const Text('Bilgilerin doğruluğundan şahsınız sorumludur',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
//******************************************************************//

            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'İsim',
                enabled: true,
              ),
              autofocus: false,
              onChanged: (girilenisim) {
                isim = girilenisim;
              },
            ),
//******************************************************************//

            const SizedBox(height: 10),
//******************************************************************//

            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Soyisim',
                enabled: true,
              ),
              autofocus: false,
              onChanged: (girilensoyad) {
                soyisim = girilensoyad;
              },
            ),
//******************************************************************//

            const SizedBox(height: 10),
//******************************************************************//

            TextField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Yaşınız',
                ),
                autofocus: false,
                onChanged: (deger) {
                  yas = int.parse(deger);
                }),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
//******************************************************************//

                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ad = isim!;
                        soyad = soyisim!;
                        yasi = yas.toString();
                      });

                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => bilgilerim()));
                    },
                    child: const Text('Kaydet ve devam et')),
              ],
            )
          ],
        ),
      )),
    );
  }
//******************************************************************//

  Future _cikisYap() async {
    FirebaseAuth.instance.signOut();
    await Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => const SignInPage()));
  }
}
