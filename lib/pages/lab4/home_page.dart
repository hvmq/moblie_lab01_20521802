import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_lab01_20521802/pages/lab4/login_screen.dart';

class HomePageLab4 extends StatefulWidget {
  final String fullName;
  const HomePageLab4({super.key, required this.fullName});

  @override
  State<HomePageLab4> createState() => _HomePageLab4State();
}

class _HomePageLab4State extends State<HomePageLab4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text(
            'Welcome to Home Page',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 10,),
          Text(widget.fullName, style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
              Get.to(() => const Login());
          }, child: Text('Log Out'))
        ]),
      ),
    );
  }
}
