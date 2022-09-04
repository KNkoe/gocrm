import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/resources/decoration.dart';
import 'package:gocrm/resources/theme.dart';

import 'price.dart';

class LocationAndPrice extends StatefulWidget {
  const LocationAndPrice({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  State<LocationAndPrice> createState() => _LocationAndPriceState();
}

class _LocationAndPriceState extends State<LocationAndPrice> {
  final List<String> locations = [
    "My Business Address",
    "At Client's Location",
    "Zoom",
    "Other",
    "Client will call",
    "You will call the client"
  ];

  String label = "";

  _selectLocation(int index) {
    switch (index) {
      case 0:
        label = "Address";
        break;
      case 1:
        label = "Address";
        break;
      case 3:
        label = "Enter meeting URL/Meeting intructions";
        break;
      case 4:
        label = "Phone number";
        break;
      case 5:
        label = "Phone number";
        break;
      default:
    }
  }

  int locationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenSize.width * 0.4,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DropdownButtonFormField<String>(
              value: locations[locationIndex],
              decoration:
                  inputDecoration1.copyWith(label: const Text("Location")),
              items: [
                DropdownMenuItem(
                    enabled: false,
                    child: Text(
                      "Face to face",
                      style: TextStyle(color: grey, fontSize: 12),
                    )),
                DropdownMenuItem(
                  value: locations[0],
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.solidBuilding,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        locations[0],
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: locations[1],
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.locationArrow,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        locations[1],
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                DropdownMenuItem(
                    enabled: false,
                    child: Text(
                      "Online",
                      style: TextStyle(color: grey, fontSize: 12),
                    )),
                DropdownMenuItem(
                  value: locations[2],
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.video,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        locations[2],
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: locations[3],
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.earthAfrica,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        locations[3],
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                DropdownMenuItem(
                    enabled: false,
                    child: Text(
                      "Over the phone",
                      style: TextStyle(color: grey, fontSize: 12),
                    )),
                DropdownMenuItem(
                  value: locations[4],
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.phone,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        locations[4],
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: locations[5],
                  child: Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.phoneFlip,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        locations[5],
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
              onChanged: (value) {}),
          const SizedBox(
            height: 30,
          ),
          const AppointmentPrice(),
        ],
      ),
    );
  }
}
