import 'package:flutter/material.dart';
import 'package:gocrm/screens/home/documents/upload.dart';

import '../../resources/decoration.dart';
import '../../resources/theme.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({Key? key}) : super(key: key);

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  double blurRadius = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (value) {
            setState(() {
              blurRadius = 13;
            });
          },
          onExit: (value) {
            setState(() {
              blurRadius = 5;
            });
          },
          child: Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  spreadRadius: -2,
                  blurRadius: blurRadius,
                  color: const Color.fromRGBO(0, 0, 0, 0.2),
                )
              ]),
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Documents",
                      style: TextStyle(fontSize: 20, color: grey)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: buttonStyle1,
                          onPressed: () {},
                          child: const Text("Add/Share Documents")),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: buttonStyle1,
                          onPressed: () {},
                          child: const Text("Request signature")),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: buttonStyle1,
                          onPressed: () {},
                          child: const Text("Request Document")),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: alertDialogSeletedButtonStyle,
                          onPressed: () {
                            upload(context);
                          },
                          child: const Text("Upload To My Documents")),
                    ],
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
