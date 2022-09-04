import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gocrm/resources/decoration.dart';
import 'package:gocrm/resources/theme.dart';

upload(BuildContext context) {
  showDialog(context: context, builder: ((context) => const UploadDocument()));
}

class UploadDocument extends StatefulWidget {
  const UploadDocument({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  String filename = "";

  _uploadfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      filename = file.name;
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        title: const Text("Upload"),
        content: Container(
          width: screenSize.width * 0.6,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _uploadfile();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: grey)),
                  child: const Text(
                    "Click to browse",
                    style: TextStyle(
                        decoration: TextDecoration.underline, color: denimBlue),
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              style: alertDialogButtonStyle,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel")),
          ElevatedButton(
              style: alertDialogSeletedButtonStyle,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Upload")),
        ],
      ),
    );
  }
}
