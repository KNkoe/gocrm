import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/resources/responsive.dart';
import 'package:gocrm/resources/theme.dart';
import 'package:gocrm/screens/dashboard/components/analytics_tile.dart';
import 'package:gocrm/screens/dashboard/drawer/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:gocrm/screens/dashboard/components/charts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool _isCollapsed = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                setState(() {
                  _isCollapsed = !_isCollapsed;
                });
              },
              icon: Icon(_isCollapsed ? Icons.clear : Icons.menu)),
          elevation: 0,
          backgroundColor: cardetBlue,
          title: Text(
            'GOCRM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.w400,
              letterSpacing: 3,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            title:
                                const Text("Are you sure you want to log out?"),
                            actions: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(cardetBlue),
                                      elevation: MaterialStateProperty.all(1)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.popAndPushNamed(
                                        context, '/login');
                                  },
                                  child: const Text("Confirm")),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(cardetBlue),
                                      elevation: MaterialStateProperty.all(1)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"))
                            ],
                          )));
                },
                icon: const FaIcon(
                  FontAwesomeIcons.powerOff,
                  size: 20,
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            CustomDrawer(screenSize: screenSize, isCollapsed: _isCollapsed),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: screenSize.width,
                color: cardetBlue.withOpacity(0.03),
                child: Column(
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
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26)),
                          padding: const EdgeInsets.all(6),
                          child: Text(DateTime.now()
                              .toLocal()
                              .toString()
                              .split(" ")[0]),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
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
                                            color:
                                                cardetBlue.withOpacity(0.03)))),
                                height: 60,
                                child: const Text(
                                  "Leads Over time",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                              ),
                              Expanded(
                                child: charts.LineChart(
                                  getSeriesData(),
                                  animate: true,
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
                ),
              ),
            )
          ]),
        ));
  }
}
