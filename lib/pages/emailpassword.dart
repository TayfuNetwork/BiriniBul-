// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:version1/control_pages/reset_password.dart';
import 'package:version1/pages/bilgilerim.dart';
import 'package:version1/pages/profil.dart';
import 'package:version1/services/auth_service.dart';

enum FormType { Register, Login }

// ignore: camel_case_types
class EmailPassword extends StatefulWidget {
  const EmailPassword({Key? key}) : super(key: key);

  @override
  State<EmailPassword> createState() => _EmailPasswordState();
}

// ignore: camel_case_types
class _EmailPasswordState extends State<EmailPassword> {
  String? _email, _sifre, _sifreTekrar;
  String? _butonText, _linkText;
  var _formType = FormType.Login;
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  _fromSubmit(BuildContext context) async {
    _formKey.currentState?.save();
    User? user;
    AuthService service = AuthService();

    if (_formType == FormType.Register) {
      if (_sifre != _sifreTekrar) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Şifreler eşleşmedi")));
        return;
      }
      user = await service.signUp(_sifre!, _email!, context);
      if (user != null) {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => const Profile()));
      }
    } else {
      user = await service.signIn(_sifre!, _email!, context);
      if (user != null) {
        await AuthService().checkUser();

        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) =>
                AuthService().isHaveProfile ? bilgilerim() : const Profile()));
      }
    }

    print(user);
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
                GestureDetector(
                  onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => ForgotPasswordPage())),
                  child: const Text('Şifreni mi unuttun?'),
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
