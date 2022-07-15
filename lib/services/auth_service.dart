import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:version1/models/user.dart';

class AuthService {
  MyUser? user;

  bool isHaveProfile = false;

  static AuthService? _instance;

  factory AuthService() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AuthService._();
      return _instance!;
    }
  }

  AuthService._();

  FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get userCollection =>
      FirebaseFirestore.instance.collection("Users");

  Future<User?> signUp(String sifre, String email) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: sifre);
      if (userCredential.user != null) {
        print(userCredential.user);
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {}
      if (e.code == "email-already-in-use") {
        print("Hata ${e.code}");
      }
    }
    return null;
  }

  Future<User?> signIn(String sifre, String email) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: sifre);
      if (userCredential.user != null) {
        print(userCredential.user);
        return userCredential.user;
      }
    } on Exception catch (e) {}
    return null;
  }

  Future checkUser() async {
    if (_auth.currentUser != null) {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await userCollection.doc(_auth.currentUser!.uid).get();
      if (doc.data() != null) {
        print(doc.data());
        try {
          MyUser user = MyUser.fromMap(doc.data()!);
          this.user = user;
          if (user.userName != null) {
            isHaveProfile = true;
          }
          return;
        } on Exception catch (_) {}
      }
    }
    isHaveProfile = false;
  }

  Future<bool> updateUser(MyUser user) async {
    try {
      await userCollection
          .doc(user.id)
          .set(user.toMap(), SetOptions(merge: true));
      this.user = user;
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }
}
