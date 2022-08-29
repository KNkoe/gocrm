import 'package:flutter/material.dart';
import 'package:gocrm/resources/theme.dart';

ButtonStyle buttonStyle = ButtonStyle(
    textStyle:
        MaterialStateProperty.all(const TextStyle(color: Colors.black87)),
    backgroundColor: MaterialStateProperty.all(teaGreen),
    elevation: MaterialStateProperty.all(0));
