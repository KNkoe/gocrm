import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../models/appointment.dart';
import '../../../resources/theme.dart';
import '../add_client.dart';
import 'components/appointment_details.dart';
import 'components/client_info.dart';
import 'components/location_price.dart';
import 'decoration.dart';

void showAP(BuildContext context, Size screenSize, DateTime startTime) {
  showDialog(
      context: context,
      builder: (context) => AP(
            startTime: startTime,
          ));
}

class AP extends StatefulWidget {
  const AP({
    Key? key,
    required DateTime startTime,
  })  : _startTime = startTime,
        super(key: key);

  final DateTime _startTime;

  @override
  State<AP> createState() => _APState();
}

class _APState extends State<AP> {
  final PageController pageController = PageController();

  bool recurring = false;

  final TextEditingController appointmentLabel = TextEditingController();

  late DateTime selectedDate;
  late TimeOfDay startTime;
  late TimeOfDay endTime;

  @override
  void initState() {
    startTime = TimeOfDay.fromDateTime(widget._startTime);
    endTime =
        TimeOfDay.fromDateTime(widget._startTime.add(const Duration(hours: 2)));
    selectedDate = widget._startTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            title: Column(
              children: [
                Text(
                  "Schedule New Appointment",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            content: Container(
              padding: const EdgeInsets.all(20),
              width: screenSize.width * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            prefixIcon: const Icon(Icons.search),
                            fillColor: teaGreen.withOpacity(0.5),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            hintText: "Search by name or email")),
                  ),
                  InkWell(
                    onTap: () {
                      addClient(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.add,
                            size: 34,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("New Client")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "All Clients",
                    style: TextStyle(color: Colors.grey.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.3,
                    child: ListView(children: [
                      InkWell(
                        onTap: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: Colors.grey[500],
                            ),
                          ),
                          title: const Text("Johnny"),
                          subtitle: const Text("Johnnypmoser@gmail.com"),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
            actionsPadding: const EdgeInsets.only(bottom: 20),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  style: buttonStyle1,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"))
            ],
          ),
        ),
        AlertDialog(
          title: Column(
            children: [
              Text(
                "Schedule New Appointment",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: screenSize.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Appointment details",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AppointmentDetails(
                          startTime: startTime,
                          endTime: endTime,
                          selectedDate: selectedDate,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: recurring,
                                onChanged: (value) {
                                  setState(() {
                                    recurring = !recurring;
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Recurring")
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LocationAndPrice(
                          screenSize: screenSize,
                        )
                      ]),
                  ClientInfo(screenSize: screenSize)
                ],
              ),
            ),
          ),
          actionsPadding: const EdgeInsets.only(bottom: 20, left: 20),
          actions: [
            ElevatedButton(
                style: buttonStyle1,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            ElevatedButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey)),
                onPressed: () {
                  Appointment appointment = Appointment(
                    subject: appointmentLabel.toString(),
                    startTime: DateTime(selectedDate.year, selectedDate.month,
                        selectedDate.day, startTime.hour, startTime.minute),
                    endTime: DateTime(selectedDate.year, selectedDate.month,
                        selectedDate.day, endTime.hour, endTime.minute),
                    color: teaGreen,
                  );

                  addAppoinment(appointment);
                  Navigator.of(context).pop();
                },
                child: const Text("Schedule Appointment"))
          ],
        )
      ],
    );
  }
}
