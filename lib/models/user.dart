// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyUser {
  String? image;
  String? email;
  String? userName;
  String? id;
  String? il;
  String? ilce;
  String? brans;
  String? mevki;
  int? yas;

  MyUser({
    this.image,
    this.email,
    this.userName,
    this.id,
    this.il,
    this.ilce,
    this.brans,
    this.mevki,
    this.yas,
  });

  MyUser copyWith({
    String? image,
    String? email,
    String? userName,
    String? id,
    String? il,
    String? ilce,
    String? brans,
    String? mevki,
    int? yas,
  }) {
    return MyUser(
      image: image ?? this.image,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      id: id ?? this.id,
      il: il ?? this.il,
      ilce: ilce ?? this.ilce,
      brans: brans ?? this.brans,
      mevki: mevki ?? this.mevki,
      yas: yas ?? this.yas,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'email': email,
      'userName': userName,
      'id': id,
      'il': il,
      'ilce': ilce,
      'brans': brans,
      'mevki': mevki,
      'yas': yas,
    };
  }

  factory MyUser.fromMap(Map<String, dynamic> map) {
    return MyUser(
      image: map['image'] != null ? map['image'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      il: map['il'] != null ? map['il'] as String : null,
      ilce: map['ilce'] != null ? map['ilce'] as String : null,
      brans: map['brans'] != null ? map['brans'] as String : null,
      mevki: map['mevki'] != null ? map['mevki'] as String : null,
      yas: map['yas'] != null ? map['yas'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyUser.fromJson(String source) =>
      MyUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyUser(image: $image, email: $email, userName: $userName, id: $id, il: $il, ilce: $ilce, brans: $brans, mevki: $mevki, yas: $yas)';
  }

  @override
  bool operator ==(covariant MyUser other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.email == email &&
        other.userName == userName &&
        other.id == id &&
        other.il == il &&
        other.ilce == ilce &&
        other.brans == brans &&
        other.mevki == mevki &&
        other.yas == yas;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        email.hashCode ^
        userName.hashCode ^
        id.hashCode ^
        il.hashCode ^
        ilce.hashCode ^
        brans.hashCode ^
        mevki.hashCode ^
        yas.hashCode;
  }
}
