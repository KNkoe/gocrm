import 'package:flutter/material.dart';
import 'package:gocrm/resources/responsive.dart';
import 'package:gocrm/resources/theme.dart';
import 'package:gocrm/screens/home/dashboard/analytics_tile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            const Text(
              "Dashboard",
              style: TextStyle(fontSize: 26, color: Colors.black54),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black26)),
              padding: const EdgeInsets.all(6),
              child: Text(DateTime.now().toLocal().toString().split(" ")[0]),
            ),
          ],
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
        Flex(
          direction: ResponsiveWidget.isSmallScreen(context)
              ? Axis.vertical
              : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnalyticsTile(
              screenSize: screenSize,
              title: "Leads Over Time",
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
        )
      ],
    );
  }
}
