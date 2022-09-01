import 'package:flutter/material.dart';
import 'package:gocrm/screens/home/calender.dart';
import 'package:gocrm/screens/home/drawer/custom_drawer.dart';

import '../../resources/theme.dart';
import 'components/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cardetBlue.withOpacity(0.03),
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: screenSize.width,
          height: screenSize.height,
          color: cardetBlue.withOpacity(0.03),
          child: const CalendarPage(),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
