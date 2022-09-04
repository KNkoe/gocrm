import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/decoration.dart';
import '../../resources/responsive.dart';
import '../../resources/theme.dart';
import 'add_client.dart';
import 'calendar/appointment.dart';
import 'dashboard/analytics_tile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double blurRadius = 5;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        MouseRegion(
          onEnter: (value) {
            setState(() {
              blurRadius = 13;
            });
          },
          onExit: (value) {
            setState(() {
              blurRadius = 5;
            });
          },
          child: Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  spreadRadius: -2,
                  blurRadius: blurRadius,
                  color: const Color.fromRGBO(0, 0, 0, 0.2),
                )
              ]),
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dashboard",
                      style: TextStyle(fontSize: 20, color: grey)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          icon: const Icon(
                            Icons.edit_calendar,
                            color: Colors.white,
                          ),
                          style: buttonStyle1,
                          onPressed: () {
                            showAP(context, screenSize, DateTime.now());
                          },
                          label: const Text("New Appointment")),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton.icon(
                          icon: const FaIcon(
                            FontAwesomeIcons.person,
                            color: Colors.white,
                          ),
                          style: buttonStyle1,
                          onPressed: () {
                            addClient(context);
                          },
                          label: const Text("New Client")),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          icon: const FaIcon(
                            FontAwesomeIcons.fileInvoice,
                            color: Colors.white,
                          ),
                          style: buttonStyle1,
                          onPressed: () {},
                          label: const Text("New Invoice")),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          icon: const Icon(
                            Icons.payment,
                            color: Colors.white,
                          ),
                          style: buttonStyle1,
                          onPressed: () {},
                          label: const Text("Record Payment")),
                    ],
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Flex(
          direction: ResponsiveWidget.isSmallScreen(context)
              ? Axis.vertical
              : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: screenSize.height * 0.4,
              width: screenSize.width * 0.25,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 3),
                      spreadRadius: -2,
                      blurRadius: 12,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 4,
                                color: cardetBlue.withOpacity(0.03)))),
                    height: 60,
                    child: const Text(
                      "Leads Over time",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            AnalyticsTile(
              screenSize: screenSize,
              title: "Leads Started",
            ),
            AnalyticsTile(
              screenSize: screenSize,
              title: "Top Leads",
            ),
          ],
        ),
      ],
    );
  }
}
