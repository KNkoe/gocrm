import 'package:flutter/material.dart';

class LocationAndPrice extends StatelessWidget {
  const LocationAndPrice({
    Key? key,
    required this.screenSize,
    required this.inputDecoration1,
  }) : super(key: key);

  final Size screenSize;
  final InputDecoration inputDecoration1;

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
        children: [
          DropdownButtonFormField<String>(
            items: ["Face to Face", "Online", "Over call"]
                .map((e) => DropdownMenuItem<String>(child: Text(e)))
                .toList(),
            onChanged: (value) {},
            decoration: inputDecoration1.copyWith(
              label: const Text("Location"),
            ),
          )
        ],
      ),
    );
  }
}
