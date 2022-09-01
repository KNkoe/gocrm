import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calendar/decoration.dart';

void addClient(BuildContext context) {
  showDialog(context: (context), builder: ((context) => const AddClient()));
}

class AddClient extends StatefulWidget {
  const AddClient({
    Key? key,
  }) : super(key: key);

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final List<String> _status = ["Lead", "Customer", "Inactive"];

  String _selectedStatus = "Lead";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: AlertDialog(
        title: Text(
          "New Client",
          style: Theme.of(context).textTheme.headline5,
        ),
        content: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: screenSize.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Contact Information",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: screenSize.width * 0.3,
                        height: 70,
                        child: TextField(
                          decoration: addClientinputDecoration.copyWith(
                              label: const Text("First Name*")),
                        )),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                        width: screenSize.width * 0.3,
                        height: 70,
                        child: TextField(
                          decoration: addClientinputDecoration.copyWith(
                              label: const Text("Last Name")),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: screenSize.width * 0.3,
                        height: 70,
                        child: TextField(
                          decoration: addClientinputDecoration.copyWith(
                              label: const Text("Email")),
                        )),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                        width: screenSize.width * 0.3,
                        height: 70,
                        child: TextField(
                          decoration: addClientinputDecoration.copyWith(
                              label: const Text("Mobile")),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: screenSize.width * 0.3,
                        height: 70,
                        child: TextField(
                          decoration: addClientinputDecoration.copyWith(
                              label: const Text("Address")),
                        )),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                        width: screenSize.width * 0.3,
                        height: 80,
                        child: DropdownButtonFormField<String>(
                            value: _selectedStatus,
                            decoration: addClientinputDecoration.copyWith(
                                label: const Text("Status"),
                                alignLabelWithHint: true),
                            items: _status
                                .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Row(
                                      children: [
                                        if (_status.indexOf(e) == 0)
                                          const Icon(Icons.flag),
                                        if (_status.indexOf(e) == 1)
                                          const Icon(Icons.person),
                                        if (_status.indexOf(e) == 2)
                                          const Icon(Icons.person_off),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(e)
                                      ],
                                    )))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedStatus = value!;
                              });
                            })),
                  ],
                ),
                const Text(
                  "Social media",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: screenSize.width * 0.3,
                    height: 70,
                    child: TextField(
                      decoration: addClientinputDecoration.copyWith(
                          icon: const Icon(Icons.facebook),
                          label: const Text("Facebook")),
                    )),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: screenSize.width * 0.3,
                    height: 70,
                    child: TextField(
                      decoration: addClientinputDecoration.copyWith(
                          icon: const FaIcon(FontAwesomeIcons.twitter),
                          label: const Text("Twitter")),
                    )),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: screenSize.width * 0.3,
                    height: 70,
                    child: TextField(
                      decoration: addClientinputDecoration.copyWith(
                          icon: const FaIcon(FontAwesomeIcons.linkedin),
                          label: const Text("Linkedin")),
                    )),
                const Text(
                  "Client details",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: double.infinity,
                    child: TextField(
                      minLines: 10,
                      maxLines: 20,
                      decoration: addClientinputDecoration.copyWith(
                          border: const OutlineInputBorder(),
                          label: const Text("Notes")),
                    ))
              ],
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(bottom: 20),
        actions: [
          ElevatedButton(
              style: buttonStyle1, onPressed: () {}, child: const Text("Save")),
          const SizedBox(
            width: 40,
          ),
          ElevatedButton(
              style: buttonStyle1,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel")),
        ],
      ),
    );
  }
}

const InputDecoration addClientinputDecoration =
    InputDecoration(border: UnderlineInputBorder());
