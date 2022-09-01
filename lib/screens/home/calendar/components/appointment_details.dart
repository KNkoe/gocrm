import 'package:flutter/material.dart';

import '../../../../resources/theme.dart';
import '../decoration.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails(
      {Key? key,
      required this.selectedDate,
      required this.startTime,
      required this.endTime,
      required this.selectDate,
      required this.selectEndTime,
      required this.selectStartTime})
      : super(key: key);

  final DateTime selectedDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Future selectStartTime;
  final Future selectEndTime;
  final Future selectDate;

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  final List<bool> _hovered = [false, false, false];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: screenSize.width * 0.4,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: inputDecoration1.copyWith(
                  label: const Text("Appointment Label")),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  widget.selectDate;
                },
                onHover: (value) {
                  setState(() {
                    _hovered[0] = value;
                  });
                },
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(color: Colors.grey[500]!)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: _hovered[0]
                        ? teaGreen.withOpacity(0.5)
                        : Colors.transparent,
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_calendar,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Start date",
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.selectedDate.toString().split(" ")[0])
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.grey[500]!)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.selectStartTime;
                      },
                      onHover: (value) {
                        setState(() {
                          _hovered[1] = value;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: _hovered[1]
                                ? teaGreen.withOpacity(0.5)
                                : Colors.transparent,
                            border: Border(
                                right: BorderSide(color: Colors.grey[500]!))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Start Time",
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(widget.startTime.format(context))
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.selectEndTime;
                      },
                      onHover: (value) {
                        setState(() {
                          _hovered[2] = value;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: _hovered[2]
                            ? teaGreen.withOpacity(0.5)
                            : Colors.transparent,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "End Time",
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(widget.endTime.format(context))
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
