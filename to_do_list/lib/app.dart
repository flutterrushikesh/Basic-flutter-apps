import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});
  @override
  State createState() => _TodolistState();
}

class _TodolistState extends State {
  void showbottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Text(
                "Create Task",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Title",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-do list",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 139, 147, 0.8),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            showbottomSheet();
          });
        },
        backgroundColor: const Color.fromRGBO(0, 139, 147, 1),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
