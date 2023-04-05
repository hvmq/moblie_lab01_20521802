import 'package:flutter/material.dart';
import 'package:mobile_lab01_20521802/pages/lab1.dart';
import 'package:mobile_lab01_20521802/pages/lab2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        
      ),
      debugShowCheckedModeBanner: false,
      home: const Lab2(),
    );
  }
}

