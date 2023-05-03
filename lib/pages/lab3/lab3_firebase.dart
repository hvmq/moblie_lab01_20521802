import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';




class Lab3 extends StatefulWidget {
  const Lab3({super.key});

  @override
  State<Lab3> createState() => _Lab3State();
}

class _Lab3State extends State<Lab3> {
  Future addUser() async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': 'Minh Quang',
      'phone': '0000000000',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: addUser, child: Text('add')),
      ),
    );
  }
}
