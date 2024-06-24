import 'package:flutter/material.dart';
import 'package:quiz_app/model/question_model.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List allQuestions = [
    const QuestionModel(
      question: "Which datatype hold the both value of int and double?",
      option: ["numeric", "int", "double", "num"],
      answerIndex: 3,
    ),
    const QuestionModel(
      question: "....... data type can be used to represent true or false",
      option: ["numeric", "int", "bool", "boolean"],
      answerIndex: 2,
    ),
    const QuestionModel(
      question: "Which of the following is not arithematic operator?",
      option: ["#", "/", "+", "-"],
      answerIndex: 0,
    ),
    const QuestionModel(
      question: "....... property is used to check the runtime data",
      option: ["runtimeType", "typeOf", "instanceOf", "runtime"],
      answerIndex: 0,
    ),
    const QuestionModel(
      question: "Which data type used to declare string",
      option: ["char", "string", "String", "str"],
      answerIndex: 2,
    ),
    const QuestionModel(
      question: "Which part of for loop is optional",
      option: [
        "Initialization",
        "Condition",
        "Interation",
        "None of the above"
      ],
      answerIndex: 3,
    ),
    const QuestionModel(
      question: "Null safety helps to prevent ........ pointer exception  ",
      option: ["runtime", "compiletime", "memory", "logical"],
      answerIndex: 1,
    ),
    const QuestionModel(
      question: "Which keyword is used to catch the exact exception?",
      option: ["catch", "on ", "if", "throw"],
      answerIndex: 1,
    ),
    const QuestionModel(
      question: "In dart, class can implements ....... interface",
      option: ["single", "static", "private", "multiple"],
      answerIndex: 3,
    ),
    const QuestionModel(
      question: "The scope of private instance variables in the class ",
      option: ["Class scope", "File scope", "Methos scope", "Folder scope"],
      answerIndex: 1,
    )
  ];

  int questionScreen = -1;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int optionColor = -1;
  int correctAnswers = 0;

  MaterialStatePropertyAll<Color?> validateAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void questionValidation() {
    setState(
      () {
        if (selectedAnswerIndex == -1) {
          return;
        }
        if (selectedAnswerIndex == allQuestions[questionIndex].answerIndex) {
          correctAnswers++;
        }
        if (selectedAnswerIndex != -1) {
          if (questionIndex < allQuestions.length - 1) {
            setState(() {
              questionIndex++;
            });
          } else {
            questionIndex = 0;
            selectedAnswerIndex = -1;
            questionScreen = 1;
          }
        }
      },
    );
  }

  String result() {
    if (correctAnswers >= 7) {
      return "Awsome..!";
    } else if (correctAnswers >= 4) {
      return "Good..!";
    } else {
      return "Better Luck Next Time..!";
    }
  }

  TextStyle textStyle() {
    if (correctAnswers >= 7) {
      return const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 30,
        color: Colors.green,
      );
    } else if (correctAnswers >= 4) {
      return const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 30,
        color: Color.fromARGB(255, 184, 222, 12),
      );
    } else {
      return const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 30,
        color: Colors.red,
      );
    }
  }

  FloatingActionButton? buttonResult() {
    if (correctAnswers <= 4) {
      return FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            questionScreen = 0;
            correctAnswers = 0;
            selectedAnswerIndex - 1;
            optionColor = -1;
          });
        },
        backgroundColor: const Color.fromRGBO(0, 70, 67, 1),
        label: const Text(
          "Restart",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return null;
    }
  }

  String resultImage() {
    if (correctAnswers >= 7) {
      return "assets/images/tropy.jpg";
    } else if (correctAnswers >= 4) {
      return "assets/images/awasome.jpg";
    } else {
      return "assets/images/opps.jpg";
    }
  }

  Scaffold screen() {
    if (questionScreen == -1) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 70, 67, 1),
        body: Center(
          child: Image.asset('assets/images/splash.png', color: Colors.white),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              questionScreen = 0;
            });
          },
          backgroundColor: Colors.white,
          label: const Text(
            "Start Quiz",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    } else if (questionScreen == 0) {
      return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                20,
              ),
              bottomRight: Radius.circular(
                20,
              ),
            ),
          ),
          title: const Text(
            "Quiz",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(0, 70, 67, 1),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Qestions : ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${allQuestions[questionIndex].question}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: validateAnswer(0),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 0;
                    });
                  }
                },
                child: Text(
                  "A. ${allQuestions[questionIndex].option[0]}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: validateAnswer(1),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 1;
                    });
                  }
                },
                child: Text(
                  "B. ${allQuestions[questionIndex].option[1]}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: validateAnswer(2),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 2;
                    });
                  }
                },
                child: Text("C. ${allQuestions[questionIndex].option[2]}",
                    style: const TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: validateAnswer(3),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 3;
                    });
                  }
                },
                child: Text(
                  "D. ${allQuestions[questionIndex].option[3]}",
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            optionColor = -1;

            setState(() {
              questionValidation();

              selectedAnswerIndex = -1;
            });
          },
          child: const Icon(Icons.arrow_forward_outlined, color: Colors.black),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 70, 67, 1),
          title: const Text(
            "Result",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 27,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                resultImage(),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your score  $correctAnswers/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                result(),
                style: textStyle(),
              ),
            ],
          ),
        ),
        floatingActionButton: buttonResult(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return screen();
  }
}
