import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Slide(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Slide extends StatefulWidget {
  const Slide({super.key});
  @override
  State createState() => _SlideState();
}

class _SlideState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(width: 300, height: 100, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
