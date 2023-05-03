import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_lab01_20521802/pages/lab1.dart';
import 'package:mobile_lab01_20521802/pages/lab2.dart';
import 'package:mobile_lab01_20521802/pages/lab3/database.dart';
import 'package:mobile_lab01_20521802/pages/lab3/lab3_firebase.dart';
import 'package:mobile_lab01_20521802/pages/lab3/lab3_sqflite_add.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await DBHelper.initDB();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        
      ),
      debugShowCheckedModeBanner: false,
      home: const Lab03(),
    );
  }
}

