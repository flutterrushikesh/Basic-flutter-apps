import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'modelclass.dart';

dynamic database;

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
