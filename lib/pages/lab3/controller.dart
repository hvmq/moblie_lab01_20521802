import 'package:get/get.dart';
import 'package:mobile_lab01_20521802/pages/lab3/database.dart';

class UserController extends GetxController {

  var userList = <User>[].obs;

  Future<int> addUser({User? user}) async {
    return await DBHelper.insert(user);
  }

  void getUsers() async {
    List<Map<String, Object?>> users = await DBHelper.query();
    userList.assignAll(users.map((data) => new User.fromJson(data)).toList());
  }
}
