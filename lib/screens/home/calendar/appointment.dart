import 'package:flutter/material.dart';
import 'package:gocrm/resources/theme.dart';
import 'package:gocrm/screens/home/add_client.dart';
import 'package:gocrm/screens/home/calendar/button.dart';

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

  DateTime startDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: [
        AlertDialog(
          title: Column(
            children: [
              Text(
                "Create new Appointment",
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
        AlertDialog(
          title: Column(
            children: [
              Text(
                "Create new Appointment",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          content: Container(
            padding: const EdgeInsets.all(20),
            width: screenSize.width * 0.8,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Contact Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: screenSize.width * 0.4,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.06),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2070),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(color: Colors.grey[300]!)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit_calendar,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Start date",
                                  style: TextStyle(color: Colors.grey[300]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(startDate.toString().split(" ")[0])
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
            ]),
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
                onPressed: () {}, child: const Text("Schedule Appointment"))
          ],
        )
      ],
    );
  }
}
