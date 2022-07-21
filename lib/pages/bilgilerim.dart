import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:version1/models/user.dart';
import 'package:version1/pages/profil.dart';
import 'package:version1/pages/search_page.dart';
import 'package:version1/pages/sign_in_page.dart';
import 'package:version1/services/auth_service.dart';
import '../control_pages/json-models.dart';

// sadece oturum açmış kişiler bu sayfayı görebilir.
// ignore: camel_case_types

class bilgilerim extends StatefulWidget {
  bilgilerim({
    Key? key,
  }) : super(key: key);

  @override
  _bilgilerimState createState() => _bilgilerimState();
}

String? ili, ilcesi, bransi, mevkisi;

// ignore: camel_case_types
class _bilgilerimState extends State<bilgilerim> {
  Brans? brans;
  String? mevki;
  BransServices model = BransServices();
  Il? il;
  String? ilce;
  IlService service = IlService();

  MyUser get user => AuthService().user!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Bilgilerin'),
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
//******************************************************************//
              const Text('Kimliğiniz', style: TextStyle(color: Colors.grey)),
              ListTile(
                title: Text("${user.userName}"),
                leading: CircleAvatar(
                  child: Text(
                    "${user.yas}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Colors.blue,
                ),
                subtitle: const Text("ili, ilçesi, branşı, mevkisi"),
                trailing: const Icon(Icons.message),
                onTap: () {},
              ),
//******************************************************************//

              const SizedBox(height: 5),
              const Divider(
                thickness: 2,
                color: Colors.green,
              ),
              const SizedBox(height: 10),

//******************************************************************//

              const Text('Kayıt oluşturmadan da gezinebilirsiniz',
                  style: TextStyle(color: Colors.grey)),

              const SizedBox(height: 10),
//******************************************************************//

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("İl:"),
                  DropdownButton<int>(
                      style: const TextStyle(color: Colors.black),
                      value: il?.plaka ?? 1,
                      items: service.iller.map((i) {
                        return DropdownMenuItem(
                          child: Text(i.il,
                              style: const TextStyle(color: Colors.black)),
                          value: i.plaka,
                          onTap: () {
                            setState(() {
                              il = i;
                              ilce = i.ilceleri.first;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (value) {}),
                ],
              ),
//******************************************************************//

              if (ilce != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("ilçe:"),
                    DropdownButton<String>(
                      value: ilce ?? il!.ilceleri.first,
                      style: const TextStyle(color: Colors.black),
                      items: service.ilceler(il!.plaka).map((i) {
                        return DropdownMenuItem(
                          child: Text(
                            i,
                            style: const TextStyle(color: Colors.black),
                          ),
                          value: i,
                          onTap: () {
                            setState(() {
                              ilce = i;
                              ilce = ilce;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (s) {},
                    ),
                  ],
                ),
//******************************************************************//
              if (il != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Branş:"),
                    DropdownButton<int>(
                      style: const TextStyle(color: Colors.black),
                      value: brans?.no ?? 82,
                      items: model.branslar.map((b) {
                        return DropdownMenuItem(
                          child: Text(b.brans,
                              style: const TextStyle(color: Colors.black)),
                          value: b.no,
                          onTap: () {
                            setState(() {
                              brans = b;
                              mevki = b.mevki.first;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (s) {},
                    ),
                  ],
                ),
//******************************************************************//

              if (mevki != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("mevki:"),
                    DropdownButton<String>(
                      value: mevki ?? brans!.mevki.first,
                      style: const TextStyle(color: Colors.black),
                      items: model.mevki(brans!.no).map((b) {
                        return DropdownMenuItem(
                          child: Text(
                            b,
                            style: const TextStyle(color: Colors.black),
                          ),
                          value: b,
                          onTap: () {
                            setState(() {
                              mevki = b;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (s) {},
                    ),
                  ],
                ),
//******************************************************************//

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (ilce != null && brans != null)
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // ad = ("$isim" + " $soyisim");

                            //yasi = yas.toString();
                            ili = (il)!.il;
                            ilcesi = ilce;
                            bransi = (brans)!.brans;
                            mevkisi = mevki;
                            MyUser user = AuthService().user!;
                            user = user.copyWith(
                              brans: bransi,
                              il: ili,
                              ilce: ilce,
                              mevki: mevki,
                            );
                            bool? res = await AuthService().updateUser(user);
                            print(res);
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => const searchPage()));
                          },
                          child: const Text('Kaydet ve partner bul'),
                        ),
                        const Text('Branş kaydınız 48 saat kalıcıdır ',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),

//******************************************************************//
                  if (ilce == null || brans == null)
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => const searchPage()));
                        },
                        child: const Text('Gezinti')),
//******************************************************************//
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
//******************************************************************//

  Future _cikisYap() async {
    FirebaseAuth.instance.signOut();
    await Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => const SignInPage()));
  }
}
