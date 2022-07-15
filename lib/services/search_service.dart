import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:version1/models/user.dart';

class SearchService {
  bool isHaveProfile = false;

  static SearchService? _instance;

  factory SearchService() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = SearchService._();
      return _instance!;
    }
  }

  SearchService._();

  CollectionReference<Map<String, dynamic>> get userCollection =>
      FirebaseFirestore.instance.collection("Users");

  Future<List<MyUser>>? search(
      String il, String ilce, String brans, String mevki) async {
    QuerySnapshot<Map<String, dynamic>> maps = await userCollection
        .where("il", isEqualTo: il)
        .where("ilce", isEqualTo: ilce)
        .where("brans", isEqualTo: brans)
        .where("mevki", isEqualTo: mevki)
        .get();
    return maps.docs.map((e) => MyUser.fromMap(e.data())).toList();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> searchStream(
      String il, String ilce, String brans, String mevki) {
    return userCollection
        .where("il", isEqualTo: il)
        .where("ilce", isEqualTo: ilce)
        .where("brans", isEqualTo: brans)
        .where("mevki", isEqualTo: mevki)
        .snapshots();
  }
}
