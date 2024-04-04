import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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

  runApp(const MyApp());
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
