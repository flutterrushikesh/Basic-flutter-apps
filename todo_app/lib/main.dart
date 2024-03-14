import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/modelclass.dart';
// import 'app.dart';
import 'login.dart';
import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
    join(
      await getDatabasesPath(),
      "Todo8DB.db",
    ),
    version: 1,
    onCreate: (db, version) {
      db.execute('''CREATE TABLE TODO1(
        taskId INTEGER PRIMARY KEY AUTOINCREMENT,
        task TEXT,
        description TEXT,
        date TEXT
      )''');
      db.execute('''CREATE TABLE SignIn(
        name TEXT,
        username TEXT,
        phone TEXT PRIMARY KEY,
        password TEXT
      )''');
    },
  );
  log("database created");
  SignInModel user1 = SignInModel(
      name: "Rushi",
      username: "rushikesh",
      phone: "1234567890",
      password: "Rushi@123");
  insertSignInData(user1);
  runApp(const MyApp());
  print("New data");
  print(await getData());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
