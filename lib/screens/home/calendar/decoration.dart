import 'package:flutter/material.dart';
import 'package:gocrm/resources/theme.dart';

ButtonStyle buttonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.black54),
    padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
    backgroundColor: MaterialStateProperty.all(teaGreen),
    elevation: MaterialStateProperty.all(0));

ButtonStyle buttonStyle1 = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.black87),
    padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
    backgroundColor: MaterialStateProperty.all(teaGreen),
    elevation: MaterialStateProperty.all(0));

InputDecoration inputDecoration1 = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[500]!),
      borderRadius: const BorderRadius.all(Radius.circular(10))),
);