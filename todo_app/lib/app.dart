import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});
  @override
  State createState() => _TodoAppState();
}

class UserData {
  String task;
  String description;
  String date;

  UserData({required this.task, required this.description, required this.date});
}

class _TodoAppState extends State {
  List todoCard = [];

  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void bottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Create To-Do",
                  style: GoogleFonts.lato(
                    fontSize: 33,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Title",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromRGBO(111, 81, 255, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                    controller: taskController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.add_task),
                      label: Text("Enter task"),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(111, 81, 255, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "plese enter task";
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromRGBO(111, 81, 255, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.description_outlined),
                      label: Text("Enter description"),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(111, 85, 255, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "plese enter description";
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Date",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: const Color.fromRGBO(111, 81, 255, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    label: Text("Enter Date"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(111, 81, 255, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickupDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025));
                    String dateFormat = DateFormat.yMMMd().format(pickupDate!);
                    setState(
                      () {
                        dateController.text = dateFormat;
                      },
                    );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "plese enter date";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      bool validateInfo = _formKey.currentState!.validate();
                      if (validateInfo) {
                        todoCard.add(
                          UserData(
                            task: taskController.text,
                            description: descriptionController.text,
                            date: dateController.text,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Details saved succefully"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("plese enter details"),
                          ),
                        );
                      }

                      Navigator.of(context).pop();
                    },
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(111, 81, 255, 1),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Rushikesh",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                          fontSize: 37,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      "Create To Do list",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              50,
                            ),
                            topLeft: Radius.circular(50),
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: todoCard.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: Slidable(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 239, 228, 193),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 158, 158, 160),
                                            spreadRadius: 1,
                                            blurRadius: 30),
                                      ]),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            margin: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOeBkBjGkyhZH_2CSVP3kQpzeYqbdUyyKbcA&s",
                                                ),
                                              ),
                                            ),
                                          ),
                                          // const SizedBox(width: 5),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  todoCard[index]["title"],
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14),
                                                  textAlign: TextAlign.start,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  todoCard[index]
                                                      ["description"],
                                                  textAlign: TextAlign.justify,
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 20,
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 15),
                                            child: const Icon(
                                              Icons.circle_outlined,
                                              size: 33,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 80,
                                          ),
                                          Text(
                                            todoCard[index]["date"],
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        shape: const CircleBorder(),
        onPressed: () {
          bottomSheet();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
