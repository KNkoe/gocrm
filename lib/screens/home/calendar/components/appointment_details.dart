import 'package:flutter/material.dart';

import '../../../../resources/theme.dart';
import '../decoration.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({
    Key? key,
    required this.selectedDate,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  final DateTime selectedDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  final List<bool> _hovered = [false, false, false];

  late DateTime selectedDate;
  late TimeOfDay startTime;
  late TimeOfDay endTime;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
    startTime = widget.startTime;
    endTime = widget.endTime;
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2070),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: startTime);

    if (picked != null && picked != startTime) {
      setState(() {
        startTime = picked;
      });
    }
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: endTime);

    if (picked != null && picked != endTime) {
      setState(() {
        endTime = picked;
      });
    }
  }

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
                  _selectDate(context);
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
                            Text(selectedDate.toString().split(" ")[0])
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
                        _selectStartTime(context);
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
                                Text(startTime.format(context))
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
                        _selectEndTime(context);
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
                                Text(endTime.format(context))
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
