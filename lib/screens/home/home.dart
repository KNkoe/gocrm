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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Widget selectedScreen(int index) {
      if (index == 0) {
        return const Dashboard();
      } else if (index == 1) {
        return const CalendarPage();
      }

      return Container();
    }

    return Row(
      children: [
        Drawer(
          backgroundColor: cardetBlue,
          width: screenSize.width * 0.15,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,

            children: <Widget>[
              DrawerHeader(
                child: Row(
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
              ),
              ListTile(
                selectedTileColor: Colors.black26,
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
                onTap: () => selectDestination(0),
              ),
              ListTile(
                selectedTileColor: Colors.black26,
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
                onTap: () => selectDestination(1),
              ),
              ListTile(
                selectedTileColor: Colors.black26,
                leading: const FaIcon(
                  FontAwesomeIcons.person,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Clients',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(2),
              ),
              ListTile(
                selectedTileColor: Colors.black26,
                leading: const FaIcon(
                  FontAwesomeIcons.coins,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Payments',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(3),
              ),
              ListTile(
                selectedTileColor: Colors.black26,
                leading: const FaIcon(
                  FontAwesomeIcons.fileInvoice,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Documents',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 4,
                onTap: () => selectDestination(4),
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
                selectedTileColor: Colors.black26,
                leading: const FaIcon(
                  FontAwesomeIcons.weebly,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Website Builder',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 5,
                onTap: () => selectDestination(5),
              ),
              ListTile(
                selectedTileColor: Colors.black26,
                leading: const FaIcon(
                  Icons.forum,
                  size: 24,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Forum',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                selected: _selectedDestination == 6,
                onTap: () => selectDestination(6),
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
