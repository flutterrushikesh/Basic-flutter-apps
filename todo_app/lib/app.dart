import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});
  @override
  State createState() => _TodoAppState();
}

class _TodoAppState extends State {
  List todoCard = [
    {
      "title": "Lorem Ipsum is simply dummy industry.",
      "description":
          "Lorem Ipsum Lorem Ipsum Lorem.Simply dummy text of the printing and type setting industry. Lorem Ipsum Lorem Ipsum Lorem.",
      "date": "10 July 2023",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Text(
            "Good Morning",
            style: GoogleFonts.quicksand(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          Text(
            "Rushikesh",
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
              fontSize: 38,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 50),
          Container(
            height: 667.5,
            width: double.infinity,
            // color: Colors.white,
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
                const SizedBox(height: 15),
                Container(
                  height: 618,
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
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 239, 228, 193),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  15,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 158, 158, 160),
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
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                          textAlign: TextAlign.start,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          todoCard[index]["description"],
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500),
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
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }
}
