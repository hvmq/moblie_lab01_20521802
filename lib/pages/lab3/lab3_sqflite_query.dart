import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SQFLiteQuery extends StatefulWidget {
  const SQFLiteQuery({super.key});

  @override
  State<SQFLiteQuery> createState() => _SQFLiteQueryState();
}

class _SQFLiteQueryState extends State<SQFLiteQuery> {
  final UserController userController = Get.put(UserController());

   void initState() {
   userController.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return ListView.builder(
                itemCount: userController.userList.length,
                itemBuilder: (_, index) {
                  print('object');
                  print(userController.userList.length);
                  return Container(
                  
                    margin: const EdgeInsets.all(8),
                    child: Row(children: [
                      Text(userController.userList[index].name.toString()),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(userController.userList[index].number.toString())
                    ]),
                  );
                });
          }))
        ],
      ),
    );
  }

  _appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
