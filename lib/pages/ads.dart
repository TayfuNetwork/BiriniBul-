import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ads extends StatefulWidget {
  const ads({Key? key}) : super(key: key);

  @override
  State<ads> createState() => _adsState();
}

class _adsState extends State<ads> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Arama Sonuçları'),
        ),
      );
}
