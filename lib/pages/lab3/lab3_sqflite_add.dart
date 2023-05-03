import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_lab01_20521802/pages/lab3/controller.dart';
import 'package:mobile_lab01_20521802/pages/lab3/database.dart';
import 'package:mobile_lab01_20521802/pages/lab3/lab3_sqflite_query.dart';
import 'package:sqflite/sqflite.dart';

class Lab03 extends StatefulWidget {
  const Lab03({super.key});

  @override
  State<Lab03> createState() => _Lab03State();
}

class _Lab03State extends State<Lab03> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Lab03'),
        backgroundColor: const Color.fromARGB(255, 5, 112, 199),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Full Name',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: fullnameController,
            decoration: InputDecoration(
                hintText: 'Please enter full name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Number',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: numberController,
            decoration: InputDecoration(
                hintText: 'Please enter number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  addUsertoDB();
                  fullnameController.clear();
                  numberController.clear();
                },
                child: const Text('Add')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const SQFLiteQuery());
                },
                child: const Text('Query')),
          ),
        ],
      ),
    );
  }

  addUsertoDB() async {
    int number = int.parse(numberController.text);
    await userController.addUser(
        user: User(
      name: fullnameController.text,
      number: number,
    ));
  }
}
