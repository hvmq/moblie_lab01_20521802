import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_lab01_20521802/pages/lab3/database.dart';
import 'package:mobile_lab01_20521802/pages/lab4/encrypt.dart';
import 'package:mobile_lab01_20521802/pages/lab4/login_screen.dart';
import 'package:mobile_lab01_20521802/pages/lab4/user_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: RichText(
                    text: const TextSpan(
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: 'Mobile ', style: TextStyle(color: Colors.blue)),
                      TextSpan(
                          text: 'Labs', style: TextStyle(color: Colors.black))
                    ])),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Container(
                      height: 4,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue))),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'FullName',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              TextFormField(
                controller: fullName,
                decoration: InputDecoration(
                    hintText: 'Please enter fullname',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Phone',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              TextFormField(
                controller: phone,
                decoration: InputDecoration(
                    hintText: 'Please enter phone',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Username',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              TextFormField(
                controller: userName,
                decoration: InputDecoration(
                    hintText: 'Please enter username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Password',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              TextFormField(
                controller: pass,
                decoration: InputDecoration(
                    hintText: 'Please enter password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        await addUser();
      
                        Get.to(() => const Login());
                      },
                      child: const Text('Sign Up'))),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Back to"),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future addUser() async {
    final user = UserModel(
        fullName: fullName.text.trim(),
        phone: phone.text.trim(),
        userName: userName.text.trim(),
        pass: MyEncryptionDecryption.encryptAES(pass.text).base64.toString());

    

    await FirebaseFirestore.instance
        .collection('Users')
        .add(user.toJon())
        .whenComplete(() => Flushbar(
              message: 'Register Sucessfullly',
              duration: Duration(seconds: 2),
              borderRadius: BorderRadius.circular(10),
              margin: EdgeInsets.all(10),
              backgroundColor: Color.fromARGB(255, 14, 209, 37),
              flushbarPosition: FlushbarPosition.TOP,
            ).show(context));
  }
}
