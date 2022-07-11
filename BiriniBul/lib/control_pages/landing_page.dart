import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:version1/pages/bilgilerim.dart';
import 'package:version1/pages/sign_in_page.dart';

class Landing_Page extends StatefulWidget {
  const Landing_Page({Key? key}) : super(key: key);

  @override
  State<Landing_Page> createState() => _Landing_PageState();
}

class _Landing_PageState extends State<Landing_Page> {
  late User? _kullanici;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_kullanici == null) {
      return SignInPage();
    } else {
      return bilgilerim();
    }
  }

  Future<void> _checkUser() async {
    _kullanici = FirebaseAuth.instance.currentUser;
  }
}
