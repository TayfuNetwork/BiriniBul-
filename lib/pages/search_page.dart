import 'package:flutter/cupertino.dart';
import 'package:version1/control_pages/json-models.dart';
import 'package:flutter/material.dart';
import 'package:version1/pages/bilgilerim.dart';
import 'package:version1/pages/gelen_kutusu.dart';
import 'package:version1/pages/results.dart';
import '../control_pages/json-models.dart';

// ignore: camel_case_types
class searchPage extends StatefulWidget {
  const searchPage({
    Key? key,
  }) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

// ignore: camel_case_types
class _searchPageState extends State<searchPage> {
  Brans? brans;
  String? mevki;
  BransServices model = BransServices();
  Il? il;
  String? ilce;
  IlService service = IlService();
  String? bulunanAd;
  String? bulunanSoyad;
  String? bulunanYas;
  String? bulunanIl;
  String? bulunanIlce;
  String? bulunanBrans;
  String? bulunanMevki;
  Future<void> arama() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Results(
          il: il!.il,
          ilce: ilce!,
          brans: brans!.brans,
          mevki: mevki!,
          ppColor: Colors.blue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arama Yap'),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: _mesajlaraGit,
          ),
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
            const Text('Partner bulman??n en kolay yolu'),
            const SizedBox(height: 20),
//******************************************************************//

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("??l:"),
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
                  onChanged: (s) {},
                ),
              ],
            ),
//******************************************************************//

            if (ilce != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("il??e:"),
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
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (s) {},
                  ),
                ],
              ),
//******************************************************************//
            if (ilce != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Bran??:"),
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
                ElevatedButton(
                    onPressed: () {
                      if (il != null && ilce != null && brans != null) {
                        arama();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "B??t??n a????l??r men??leri doldurmal??s??n??z")));
                      }
                    },
                    child: const Text('Ara')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => bilgilerim()));
                    },
                    child: const Text('Bilgilerin')),
              ],
            ),
          ],
        ),
      )),
    );
  }

  _mesajlaraGit() {
    return Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => Inbox()));
  }
}
