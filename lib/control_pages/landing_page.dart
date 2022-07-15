import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:version1/pages/bilgilerim.dart';
import 'package:version1/pages/profil.dart';
import 'package:version1/pages/sign_in_page.dart';
import 'package:version1/services/auth_service.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return const SignInPage();
    } else {
      if (AuthService().isHaveProfile) {
        return bilgilerim();
      } else {
        return const Profile();
      }
    }
  }
}
