// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../resources/decoration.dart';

class AppointmentPrice extends StatefulWidget {
  const AppointmentPrice({
    Key? key,
  }) : super(key: key);

  @override
  State<AppointmentPrice> createState() => _AppointmentPriceState();
}

class _AppointmentPriceState extends State<AppointmentPrice> {
  final List<String> prices = ["Fixed price", "Custom price", "No fee"];

  int priceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        decoration: inputDecoration1.copyWith(label: const Text("Price")),
        value: prices[priceIndex],
        items: [
          DropdownMenuItem(value: prices[0], child: Text(prices[0])),
          DropdownMenuItem(value: prices[1], child: Text(prices[1])),
          DropdownMenuItem(value: prices[2], child: Text(prices[2]))
        ],
        onChanged: (value) {});
  }
}
