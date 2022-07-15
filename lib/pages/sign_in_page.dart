// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:version1/pages/emailpassword.dart';
import 'package:version1/pages/bilgilerim.dart';
import 'package:version1/pages/profil.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

// ignore: duplicate_ignore
class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Hadi Başlayalım'),
        elevation: 0,
      ),
//******************************************************************//

      backgroundColor: Colors.grey.shade300,
      body: Container(
        color: const Color.fromARGB(255, 200, 207, 213),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Oturum Açın",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            ),
            const SizedBox(height: 8),
            //******************************************************************//
            GoogleGirisi(),
            //******************************************************************//

            RaisedButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const emailPassword()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.email),
                  const Text(
                    'Email ve Şifre ile oturum aç',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.email, color: Colors.white.withOpacity(0)),
                ],
              ),
              color: Colors.purple,
            ),

            AnonimGiris(),
            //******************************************************************//
          ],
        ),
      ),
    );
  }

  //non_constant_identifier_names
  RaisedButton AnonimGiris() {
    return RaisedButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      onPressed: _misafirGirisi,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/google-logo.png"),
          const Text(
            'anonim oturum test',
            style: TextStyle(color: Colors.black87),
          ),
          Image.asset(
            "images/google-logo.png",
            color: Colors.white.withOpacity(0),
          ),
        ],
      ),
      color: Colors.grey.shade300,
    );
  }

  RaisedButton GoogleGirisi() {
    return RaisedButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      onPressed: _googleGirisi,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/google-logo.png"),
          const Text(
            'Google ile oturum aç',
            style: TextStyle(color: Colors.black87),
          ),
          Image.asset(
            "images/google-logo.png",
            color: Colors.white.withOpacity(0),
          ),
        ],
      ),
      color: Colors.grey.shade300,
    );
  }
//******************************************************************//

  void _misafirGirisi() async {
    UserCredential sonuc = await FirebaseAuth.instance.signInAnonymously();
    await Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => const profile()));

    print("oturum açan id: " + sonuc.user!.uid.toString());
  }
//******************************************************************//

  _googleGirisi() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        UserCredential sonuc = await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        User? _user = sonuc.user;
        await Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => const profile()));

        return _user;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
