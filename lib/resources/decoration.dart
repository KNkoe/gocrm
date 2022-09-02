import 'package:flutter/material.dart';
import 'package:gocrm/resources/theme.dart';

ButtonStyle alertDialogButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.black),
    padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
    backgroundColor: MaterialStateProperty.all(teaGreen),
    elevation: MaterialStateProperty.all(1));

ButtonStyle buttonStyle1 = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white),
    fixedSize: MaterialStateProperty.all(const Size.fromHeight(40)),
    backgroundColor: MaterialStateProperty.all(oceanGreen),
    elevation: MaterialStateProperty.all(0));

InputDecoration inputDecoration1 = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[500]!),
      borderRadius: const BorderRadius.all(Radius.circular(10))),
);
