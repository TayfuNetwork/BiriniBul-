import 'package:flutter/material.dart';
import 'package:version1/pages/bilgilerim.dart';

// ignore: camel_case_types
class results extends StatefulWidget {
  const results({Key? key}) : super(key: key);

  @override
  State<results> createState() => _resultsState();
}

// ignore: camel_case_types
class _resultsState extends State<results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arama Sonuçları'),
        actions: const <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text("firebaseden çekilecek"),
              leading: const CircleAvatar(
                child: Text(
                  "??",
                  style: const TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.blue,
              ),
              subtitle: Text("$ili, $ilcesi, $bransi, $mevkisi"),
              trailing: const Icon(Icons.message),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
