import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_lab01_20521802/pages/lab4/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _userData = [];
  List<UserModel> get userData => _userData;

  Future<void> getUser(String username) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .where("UserName", isEqualTo: username)
          .get();
      final user = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
      _userData.add(user);
      print(user);
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
