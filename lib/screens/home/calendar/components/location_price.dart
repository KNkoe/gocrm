import 'package:flutter/material.dart';

class LocationAndPrice extends StatelessWidget {
  const LocationAndPrice({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: screenSize.width * 0.4,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: const [
          Text(""),
        ],
      ),
    );
  }
}
