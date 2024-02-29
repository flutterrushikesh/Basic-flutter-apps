import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});
  @override
  State createState() => _TodolistState();
}

class TuduModel {
  String title;
  String description;
  String date;

  TuduModel(
      {required this.title, required this.description, required this.date});
}

class _TodolistState extends State {
//Controllers to store user input data.

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

//Focus node for focus at a time 1 textfield.
  FocusNode titleFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode dateFocusNode = FocusNode();

  List cardList = [];

  List colorList = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
  ];

  void editCard(TuduModel toduClassObj) {
    titleController.text = toduClassObj.title;
    descriptionController.text = toduClassObj.description;
    dateController.text = toduClassObj.date;

    showbottomSheet(true, toduClassObj);
  }

  void deletCard(TuduModel todumodelobj) {
    setState(() {
      cardList.remove(todumodelobj);
    });
  }

  void submitCard(bool doEdit, [TuduModel? tuduClassObj]) {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!doEdit) {
        setState(() {
          cardList.add(TuduModel(
              title: titleController.text,
              description: descriptionController.text,
              date: dateController.text));
        });
      } else {
        setState(() {
          tuduClassObj!.title = titleController.text.trim();
          tuduClassObj.description = descriptionController.text.trim();
          tuduClassObj.date = dateController.text.trim();
        });
      }
    }
    // clearData();
  }

  void clearData() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void showbottomSheet(bool doEdit, [TuduModel? classObj]) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Create Task",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "Title",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: const Color.fromRGBO(0, 139, 147, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              TextField(
                controller: titleController,
                focusNode: titleFocusNode,
                autofocus: false,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 139, 147, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 139, 149, 1),
                    ),
                  ),
                ),
                cursorColor: const Color.fromRGBO(0, 139, 147, 1),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                onChanged: (value) => value,
                onSubmitted: (value) => value,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "Description",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: const Color.fromRGBO(0, 139, 147, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              TextField(
                controller: descriptionController,
                focusNode: descriptionFocusNode,
                maxLines: 2,
                autofocus: false,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 139, 147, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 137, 149, 1),
                    ),
                  ),
                ),
                cursorColor: const Color.fromRGBO(0, 139, 147, 1),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                onChanged: (value) => value,
                onSubmitted: (value) => value,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Date",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: const Color.fromRGBO(0, 139, 147, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              TextField(
                controller: dateController,
                focusNode: dateFocusNode,
                autofocus: false,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_month_outlined,
                    size: 28,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 139, 147, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 139, 147, 1),
                    ),
                  ),
                ),
                onTap: () async {
                  DateTime? pikkupDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2025),
                  );
                  String dateFormate = DateFormat.yMMMd().format(pikkupDate!);
                  setState(() {
                    dateController.text = dateFormate;
                  });
                },
                readOnly: true,
                cursorColor: const Color.fromRGBO(0, 139, 147, 1),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                onChanged: (value) => value,
                onSubmitted: (value) => value,
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(0, 139, 147, 1),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      doEdit
                          ? submitCard(
                              doEdit,
                              classObj,
                            )
                          : submitCard(doEdit);
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text(
                    "Submit",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
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
          setState(
            () {
              clearData();
              showbottomSheet(false);
            },
          );
        },
        backgroundColor: const Color.fromRGBO(0, 139, 147, 1),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: cardList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorList[index % colorList.length],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 3,
                  blurRadius: 20,
                  offset: Offset(-2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx8jFInSzc9CEmdkEtonMo_ijOM5GI3Y0quQ&s'))),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            cardList[index].title,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            cardList[index].description,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      cardList[index].date,
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        editCard(cardList[index]);
                      },
                      child: const Icon(
                        Icons.edit,
                        size: 27,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        size: 27,
                      ),
                      onTap: () {
                        deletCard(cardList[index]);
                      },
                    ),
                    const SizedBox(width: 6)
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
