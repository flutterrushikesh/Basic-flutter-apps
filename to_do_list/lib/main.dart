import 'package:flutter/material.dart';
import 'package:to_do_list/view/todo_screen.dart';

void main() {
  //Entry point of application.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}
