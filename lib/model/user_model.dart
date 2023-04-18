import 'package:flutter/material.dart';

class UserModel {
  String? uid;
  String? email;
  String? userName;
  String? pno="N/A";
  String? address = "N/A";

  UserModel({this.uid, this.email, this.userName, this.pno,this.address});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
      pno: map['pno'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'pno': pno,
      'address': address,
    };
  }
}
