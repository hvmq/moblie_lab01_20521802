import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String phone;
  final String userName;
  final String pass;

  const UserModel(
      {this.id,
      required this.fullName,
      required this.phone,
      required this.userName,
      required this.pass});

  toJon() {
    return {
      "FullName": fullName,
      "Phone": phone,
      "UserName": userName,
      "PassWord": pass,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return UserModel(
      id: document.id,
      fullName: data!["FullName"], 
      phone: data["Phone"], 
      userName: data["UserName"], 
      pass: data["PassWord"]);
  }
}
