import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:version1/models/user.dart';

import 'package:version1/pages/bilgilerim.dart';
import 'package:version1/pages/sign_in_page.dart';
import 'package:version1/services/auth_service.dart';

import '../control_pages/json-models.dart';

// ignore: camel_case_types

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

String? ad, soyad, yasi;

class _ProfileState extends State<Profile> {
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
        title: Text('Profil ${AuthService().user?.id}'),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('DIKKAT !! Bilgiler değiştirilemez',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            const Text('Bilgilerin doğruluğundan şahsınız sorumludur',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),

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
                  yas = int.tryParse(deger) ?? 0;
                }),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
//******************************************************************//

                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        ad = isim!;
                        soyad = soyisim!;
                        yasi = yas.toString();
                      });
                      User user = FirebaseAuth.instance.currentUser!;
                      await FirebaseAuth.instance.currentUser!
                          .updateDisplayName(
                        ad! + " " + soyad!,
                      );

                      MyUser myUser = MyUser(
                        email: user.email ?? "email",
                        userName: ad ?? "name",
                        id: user.uid,
                        yas: yas,
                      );

                      bool? res = await AuthService().updateUser(myUser);
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
