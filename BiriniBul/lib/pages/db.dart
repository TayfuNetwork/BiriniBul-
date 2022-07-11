import 'package:firebase_auth/firebase_auth.dart';

abstract class DBbase {

  Future<User> saveUser(User user);
}