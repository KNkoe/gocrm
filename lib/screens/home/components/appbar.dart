import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/resources/decoration.dart';

import '../../../resources/theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      backgroundColor: cardetBlue.withOpacity(0.1),
      automaticallyImplyLeading: false,
      actions: [
        Container(
          width: screenSize.width * 0.2,
          decoration: const BoxDecoration(
              color: cardetBlue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: const Text(
                                  "Are you sure you want to log out?"),
                              actions: [
                                ElevatedButton(
                                    style: alertDialogButtonStyle,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.popAndPushNamed(
                                          context, '/login');
                                    },
                                    child: const Text("Confirm")),
                                ElevatedButton(
                                    style: alertDialogButtonStyle,
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
                width: 20,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
