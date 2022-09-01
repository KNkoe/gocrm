import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                        title: const Text("Are you sure you want to log out?"),
                        actions: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(cardetBlue),
                                  elevation: MaterialStateProperty.all(1)),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.popAndPushNamed(context, '/login');
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
