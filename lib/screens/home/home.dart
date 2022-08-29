import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/resources/theme.dart';
import 'package:gocrm/screens/home/calender.dart';
import 'package:gocrm/screens/home/drawer/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isCollapsed = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                setState(() {
                  _isCollapsed = !_isCollapsed;
                });
              },
              icon: Icon(_isCollapsed ? Icons.clear : Icons.menu)),
          elevation: 0,
          backgroundColor: cardetBlue,
          title: Text(
            'GOCRM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.w400,
              letterSpacing: 3,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            title:
                                const Text("Are you sure you want to log out?"),
                            actions: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(cardetBlue),
                                      elevation: MaterialStateProperty.all(1)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.popAndPushNamed(
                                        context, '/login');
                                  },
                                  child: const Text("Confirm")),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(cardetBlue),
                                      elevation: MaterialStateProperty.all(1)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"))
                            ],
                          )));
                },
                icon: const FaIcon(
                  FontAwesomeIcons.powerOff,
                  size: 20,
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Container(
          color: cardetBlue.withOpacity(0.03),
          child: Row(children: [
            CustomDrawer(screenSize: screenSize, isCollapsed: _isCollapsed),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: _isCollapsed
                    ? screenSize.width - (screenSize.width * 0.15)
                    : screenSize.width - 60,
                height: screenSize.height,
                color: cardetBlue.withOpacity(0.03),
                child: const CalendarPage(),
              ),
            )
          ]),
        ));
  }
}
