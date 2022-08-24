import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/resources/theme.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: lightGreen.withOpacity(0.2),
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: cardetBlue.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                height: screenSize.height * 0.85,
                width: screenSize.width * 0.25,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.popAndPushNamed(context, '/');
                            },
                            child: const Icon(
                              Icons.clear,
                              size: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      const Text(
                        "Sign up!",
                        style: TextStyle(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Register an account for free",
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SizedBox(
                            height: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  label: Text("Enter Names"),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)))),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  label: Text("Enter Email"),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)))),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          pageController.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn);
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            fixedSize: MaterialStateProperty.all(
                                Size((screenSize.width * 0.2), 40)),
                            backgroundColor:
                                MaterialStateProperty.all(porlandOrange)),
                        label: const Text("Next"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("or continue with",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5))),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.facebook),
                          SizedBox(
                            width: 20,
                          ),
                          FaIcon(FontAwesomeIcons.google)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already a member? "),
                          InkWell(
                            onTap: () {
                              Navigator.popAndPushNamed(context, '/login');
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(color: denimBlue),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: cardetBlue.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                height: screenSize.height * 0.85,
                width: screenSize.width * 0.25,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Company",
                        style: TextStyle(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SizedBox(
                            height: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  label: Text("Enter Company Name"),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)))),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  label: Text("Enter Your Role"),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)))),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          pageController.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn);
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            fixedSize: MaterialStateProperty.all(
                                Size((screenSize.width * 0.2), 40)),
                            backgroundColor:
                                MaterialStateProperty.all(porlandOrange)),
                        label: const Text("Next"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          pageController.jumpToPage(0);
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            fixedSize: MaterialStateProperty.all(
                                Size((screenSize.width * 0.2), 40)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey)),
                        label: const Text("Back"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ]),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: cardetBlue.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                height: screenSize.height * 0.85,
                width: screenSize.width * 0.25,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Create Password",
                        style: TextStyle(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SizedBox(
                            height: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  label: Text("Enter Password"),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)))),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  label: Text("Confirm Password"),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)))),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.login_sharp),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/');
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            fixedSize: MaterialStateProperty.all(
                                Size((screenSize.width * 0.2), 40)),
                            backgroundColor:
                                MaterialStateProperty.all(porlandOrange)),
                        label: const Text("Sign up"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
