import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/resources/theme.dart';
import 'package:gocrm/screens/dashboard/drawer/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
        body: Row(children: [
          CustomDrawer(
            screenSize: screenSize,
            isCollapsed: _isCollapsed,
          )
        ]));
  }
}
