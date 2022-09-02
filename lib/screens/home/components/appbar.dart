import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/resources/decoration.dart';

import '../../../resources/theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  _logout(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text("Are you sure you want to log out?"),
              actions: [
                ElevatedButton(
                    style: alertDialogButtonStyle,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.popAndPushNamed(context, '/login');
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
  }

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
              PopupMenuButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white54),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white70,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Johnny Moser"),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                      enabled: false,
                      child: Container(
                        height: 200,
                        width: 500,
                        decoration: const BoxDecoration(color: teaGreen),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              minRadius: 40,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Johnny Moser"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Johnnypmoser@gmail.com",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.person_outlined),
                      title: Text(
                        'My Account',
                      ),
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        _logout(context);
                      },
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    _logout(context);
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
