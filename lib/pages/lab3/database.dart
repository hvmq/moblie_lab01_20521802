import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class User {
  String? name;
  int? number;

  User({this.name, this.number});

  User.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    number = json["number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['number'] = this.number;
    return data;
  }
}

class DBHelper {
  static Database? _database;
  static const int version = 1;
  static const String tableName = "TableUser";

  static Future<void> initDB() async {
    if (_database != null) {
      return;
    }
    try {
      _database = await openDatabase(
          join(await getDatabasesPath(), "TableUser.db"),
          version: version, onCreate: (db, version) {
        print('hello');
        return db.execute(
          "CREATE TABLE $tableName("
          "name STRING, "
          "number INTEGER)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(User? user) async {
    return await _database?.insert(tableName, user!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _database!.query(tableName);
  }
}
