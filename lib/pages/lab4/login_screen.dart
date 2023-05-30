import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_lab01_20521802/pages/lab4/encrypt.dart';
import 'package:mobile_lab01_20521802/pages/lab4/home_page.dart';
import 'package:mobile_lab01_20521802/pages/lab4/signup_screen.dart';
import 'package:mobile_lab01_20521802/pages/lab4/user_model.dart';
import 'package:mobile_lab01_20521802/pages/lab4/user_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _userName = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
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
              height: 60,
            ),
            const Text(
              'Username',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            TextFormField(
              controller: _userName,
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
              controller: _pass,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Please enter password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<UserProvider>(
              builder: (context, userData, child) => Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await Provider.of<UserProvider>(context, listen: false)
                        .getUser(_userName.text);
                    String encryptPass =
                        MyEncryptionDecryption.encryptAES(_pass.text).base64.toString();
                    if (userData.userData.isEmpty) {
                      SnackbarFail();
                    } else {
                      if (encryptPass == userData.userData[0].pass) {
                        Get.to(() => HomePageLab4(fullName: userData.userData[0].fullName,));
                        print(encryptPass);
                      } else {
                        print(encryptPass);
                        SnackbarFail();
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Get.to(() => const SignUp());
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void SnackbarFail() {
    Flushbar(
      message: 'Username or Password incorrect',
      duration: Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.all(10),
      backgroundColor: Colors.red,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
