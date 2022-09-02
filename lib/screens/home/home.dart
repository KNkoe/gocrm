import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/screens/home/calender.dart';
import 'package:gocrm/screens/home/components/appbar.dart';
import 'package:gocrm/screens/home/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;

  final List<bool> _isCollapsed = [false];

  _resetCollapsed() {
    for (int i = 0; i < _isCollapsed.length; i++) {
      _isCollapsed[i] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedScreen(int index) {
      if (index == 0) {
        return const Dashboard();
      } else if (index == 1) {
        return const CalendarPage();
      } else if (index == 2) {
        return const CalendarPage();
      }

      return Container();
    }

    return Row(
      children: [
        Drawer(
          backgroundColor: cardetBlue,
          width: 220,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,

            children: <Widget>[
              DrawerHeader(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(-60, -30),
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                            color: Colors.white12, shape: BoxShape.circle),
                      ),
                    ),
                    Row(
                      children: [
                        const Image(
                            height: 30,
                            width: 30,
                            image: AssetImage("assets/images/go.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'GOCRM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                selectedTileColor: Colors.white24,
                leading: const FaIcon(
                  FontAwesomeIcons.boxArchive,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Dashboard',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 0,
                onTap: () {
                  _resetCollapsed();
                  selectDestination(0);
                },
              ),
              ListTile(
                selectedTileColor: Colors.white24,
                leading: const FaIcon(
                  FontAwesomeIcons.calendar,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Calendar',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 1,
                onTap: () {
                  _isCollapsed[0] = !_isCollapsed[0];
                  selectDestination(1);
                },
              ),
              if (_isCollapsed[0])
                Column(
                  children: [
                    ListTile(
                      selectedTileColor: Colors.white12,
                      tileColor: Colors.white24,
                      title: Row(
                        children: const [
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Calendar View',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                      selected: _selectedDestination == 2,
                      onTap: () => selectDestination(2),
                    ),
                    ListTile(
                      selectedTileColor: Colors.white12,
                      tileColor: Colors.white24,
                      title: Row(
                        children: const [
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Appointments',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                      selected: _selectedDestination == 3,
                      onTap: () => selectDestination(3),
                    ),
                    ListTile(
                      selectedTileColor: Colors.white12,
                      tileColor: Colors.white24,
                      title: Row(
                        children: const [
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Events',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                      selected: _selectedDestination == 4,
                      onTap: () => selectDestination(4),
                    ),
                  ],
                ),
              ListTile(
                selectedTileColor: Colors.white24,
                leading: const FaIcon(
                  FontAwesomeIcons.person,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Clients',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 5,
                onTap: () {
                  _resetCollapsed();
                  selectDestination(5);
                },
              ),
              ListTile(
                selectedTileColor: Colors.white24,
                leading: const FaIcon(
                  FontAwesomeIcons.coins,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Payments',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 6,
                onTap: () {
                  _resetCollapsed();
                  selectDestination(6);
                },
              ),
              ListTile(
                selectedTileColor: Colors.white24,
                leading: const FaIcon(
                  FontAwesomeIcons.fileInvoice,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Documents',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 7,
                onTap: () {
                  _resetCollapsed();
                  selectDestination(7);
                },
              ),
              const Divider(
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Other',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
              ListTile(
                selectedTileColor: Colors.white24,
                leading: const FaIcon(
                  FontAwesomeIcons.weebly,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Website Builder',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 8,
                onTap: () {
                  _resetCollapsed();
                  selectDestination(8);
                },
              ),
              ListTile(
                selectedTileColor: Colors.white24,
                leading: const FaIcon(
                  Icons.forum,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Forum',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 9,
                onTap: () {
                  _resetCollapsed();
                  selectDestination(9);
                },
              ),
              const Divider(
                thickness: 1,
              ),
              const AboutListTile(
                icon: Icon(
                  Icons.info,
                  color: Colors.black38,
                ),
                applicationIcon: Image(
                    height: 30,
                    width: 30,
                    image: AssetImage("assets/images/go.png")),
                applicationName: "GoCRM",
                child: Text(
                  "About",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
        const VerticalDivider(
          width: 1,
          thickness: 1,
        ),
        Expanded(
            child: Scaffold(
          backgroundColor: cardetBlue.withOpacity(0.03),
          appBar: const MyAppBar(),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: selectedScreen(_selectedDestination),
            ),
          ),
        )),
      ],
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
