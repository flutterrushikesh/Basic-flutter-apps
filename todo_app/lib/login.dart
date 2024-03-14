import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/database.dart';
import 'package:todo_app/modelclass.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State createState() => _LoginState();
}

class _LoginState extends State {
  //Controllers for login
  // TextEditingController usernameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

//Controllers for signin
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isLogin = false;

  Scaffold isLoginScreen() {
    if (isLogin == false) {
      return Scaffold(
        body: Container(
          height: 700,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(7, 168, 171, 0.936),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(400),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              Text(
                "Welcome in our",
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "To-Do List",
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                height: 307,
                width: 280,
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(162, 160, 168, 1),
                      // spreadRadius: 1.3,
                      blurRadius: 20,
                      offset: Offset(-4, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: usernameController,
                      autofocus: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        hintText: "Enter username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter username";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: passwordController,
                      autofocus: false,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        hintText: "Enter password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
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
                                  Color.fromRGBO(7, 168, 171, 0.936),
                                )),
                            onPressed: () {},
                            child: Text(
                              "Login",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLogin = true;
                            });
                          },
                          child: Text(
                            "Create account...",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          height: 700,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(7, 168, 171, 0.936),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(400),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 87),
              Text(
                "Let's register in",
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "To-Do List",
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                height: 420,
                width: 300,
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(162, 160, 168, 1),
                      // spreadRadius: 1.3,
                      blurRadius: 20,
                      offset: Offset(-4, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      autofocus: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        hintText: "Enter name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: usernameController,
                      autofocus: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_4_outlined),
                        hintText: "username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter username";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: phoneNoController,
                      autofocus: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Enter phone no",
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: passwordController,
                      autofocus: false,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        hintText: "Enter password",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
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
                                  Color.fromRGBO(7, 168, 171, 0.936),
                                )),
                            onPressed: () {
                              setState(
                                () {
                                  setState(
                                    () {
                                      inserObj();
                                      clearControllers();
                                    },
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Sign in",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoginScreen();
  }

  void clearControllers() {
    nameController.clear();
    usernameController.clear();
    phoneNoController.clear();
    passwordController.clear();
  }

  void inserObj() {
    if (usernameController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty &&
        nameController.text.trim().isNotEmpty &&
        phoneNoController.text.trim().isNotEmpty) {
      SignInModel userDetail = SignInModel(
        name: nameController.text,
        username: usernameController.text,
        phone: phoneNoController.text,
        password: passwordController.text,
      );
      insertSignInData(userDetail);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Let's login"),
        ),
      );
      isLogin = false;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter details"),
        ),
      );
    }
  }
}
