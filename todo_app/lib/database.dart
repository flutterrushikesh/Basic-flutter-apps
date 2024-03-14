import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'modelclass.dart';

dynamic database;
//Database for todolist
Future<void> insertCard(UserData obj) async {
  // Database
  final localDB = await database;
  log(database.path);
  await localDB.insert(
    'TODO1',
    obj.userMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<UserData>> retriveData() async {
  final localDB = await database;

  List<Map<String, dynamic>> retData = await localDB.query("TODO1");
  return List.generate(retData.length, (i) {
    print(retData[i]['taskId']);
    return UserData(
      taskId: retData[i]['taskId'],
      task: retData[i]['task'],
      description: retData[i]['description'],
      date: retData[i]['date'],
    );
  });
}

//database for signin
Future<void> insertSignInData(SignInModel obj) async {
  final localDB = await database;

  await localDB.insert(
    'SignIn',
    obj.signInMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future getData() async {
  final localDB = await database;
  List<Map<String, dynamic>> retList = await localDB.query('SignIn');
  return List.generate(
    retList.length,
    (i) {
      return SignInModel(
        name: retList[i]['name'],
        username: retList[i]['username'],
        phone: retList[i]['phone'],
        password: retList[i]['password'],
      );
    },
  );
  // await localDB
}
