import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/resources/theme.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: cardetBlue,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white))),
              child: Column(
                children: [
                  CircleAvatar(
                    minRadius: 40,
                    child: Icon(
                      Icons.person,
                      color: grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Johnnypmoser@gmail.com",
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              )),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.boxArchive,
              size: 24,
              color: Colors.white,
            ),
            title: const Text(
              'Dashboard',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.calendar,
              size: 24,
              color: Colors.white,
            ),
            title: const Text(
              'Calendar',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.peopleGroup,
              size: 24,
              color: Colors.white,
            ),
            title: const Text(
              'Clients',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.coins,
              size: 24,
              color: Colors.white,
            ),
            title: const Text(
              'Payments',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.fileInvoice,
              size: 24,
              color: Colors.white,
            ),
            title: const Text(
              'Documents',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Colors.white10,
            thickness: 1,
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.weebly,
              size: 24,
              color: Colors.white,
            ),
            title: const Text(
              'Website Builder',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const FaIcon(
              Icons.forum,
              size: 24,
              color: Colors.white,
            ),
            title: const Text(
              'Forum',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Colors.white10,
            thickness: 1,
          ),
          const AboutListTile(
            icon: FaIcon(
              FontAwesomeIcons.info,
              size: 24,
            ),
            applicationIcon: Image(
                height: 30,
                width: 30,
                image: AssetImage("assets/images/go.png")),
            applicationName: "GoCRM",
          ),
        ],
      ),
    );
  }
}
