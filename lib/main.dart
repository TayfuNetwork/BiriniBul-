import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:version1/control_pages/landing_page.dart';
import 'package:version1/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AuthService().checkUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiriniBul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const LandingPage(),
    );
  }
}
