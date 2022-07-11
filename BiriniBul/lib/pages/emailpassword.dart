// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:version1/pages/profil.dart';

enum FormType { Register, Login }

// ignore: camel_case_types
class emailPassword extends StatefulWidget {
  const emailPassword({Key? key}) : super(key: key);

  @override
  State<emailPassword> createState() => _emailPasswordState();
}

// ignore: camel_case_types
class _emailPasswordState extends State<emailPassword> {
  String? _email, _sifre, _sifreTekrar;
  String? _butonText, _linkText;
  var _formType = FormType.Login;
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  _fromSubmit(BuildContext context) async {
    _formKey.currentState?.save();
    User? user;
    try {
      if (_formType == FormType.Register) {
        if (_sifre != _sifreTekrar) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Şifreler eşleşmedi")));
          return;
        }
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: _email!, password: _sifre!);
        if (userCredential.user != null) {
          print(userCredential.user);
          user = userCredential.user;
        }
      } else {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: _email!, password: _sifre!);
        if (userCredential.user != null) {
          print(userCredential.user);
          user = userCredential.user;
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        setState(() {
          _formType = FormType.Register;
        });

        print("Kayıtlı kullanıcı yok ${e.code}");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Kayıtlı kullanıcı yok")));
      }
      if (e.code == "email-already-in-use") {
        setState(() {
          _formType = FormType.Login;
        });

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Email daha önceden kayıt edilmiş")));
        print("Hata ${e.code}");
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Hata: ${e.code}")));
    }

    print(user);
    if (user != null) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => const profile()));
    }
  }

  @override
  Widget build(BuildContext context) {
    _butonText = _formType == FormType.Login ? "Giriş Yap" : "Kayıt Ol";
    _linkText = _formType == FormType.Register
        ? "Zaten kayıtlı mısınız? Oturum açın"
        : "Hesabınız yok mu? Hemen Kayıt Olun";

    return Scaffold(
        appBar: AppBar(
          title: const Text('Giriş / Kayıt'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (String? girilenemail) {
                    _email = girilenemail;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    hintText: 'Şifre',
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (String? girilensifre) {
                    _sifre = girilensifre;
                  },
                ),
                const SizedBox(height: 8),
                if (_formType == FormType.Register) ...[
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: 'Şifre Tekrar',
                      labelText: 'Şifre Tekrar',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (String? girilensifre) {
                      _sifreTekrar = girilensifre;
                    },
                  ),
                ],
                ElevatedButton(
                  onPressed: () => _fromSubmit(context),
                  child: Text(_butonText!),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => degistir(),
                  child: Text(_linkText!),
                )
              ],
            ),
          ),
        ));
  }

  degistir() {
    setState(() {
      _formType =
          _formType == FormType.Login ? FormType.Register : FormType.Login;
    });
  }
}
