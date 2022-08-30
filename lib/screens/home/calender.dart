import 'package:flutter/material.dart';
import 'package:gocrm/screens/home/appointment.dart';
import 'package:gocrm/screens/home/calendar/button.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final List<CalendarView> views = [
    CalendarView.day,
    CalendarView.week,
    CalendarView.month,
  ];

  final CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            height: 90,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                spreadRadius: -2,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              )
            ]),
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Calendar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: const Text("New Appointment"))
              ],
            )),
        Container(
            margin: const EdgeInsets.only(top: 10),
            height: screenSize.height * 0.7,
            width: double.infinity,
            child: SfCalendar(
              controller: calendarController,
              allowedViews: views,
              viewNavigationMode: ViewNavigationMode.snap,
              dataSource: MeetingDataSource(getDataSource()),
              monthViewSettings: const MonthViewSettings(
                  showAgenda: true,
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
              showDatePickerButton: true,
              showCurrentTimeIndicator: true,
              showNavigationArrow: true,
              onTap: (CalendarTapDetails details) {
                final Appointment appointment = Appointment(
                    startTime: details.date!,
                    endTime: details.date!.add(const Duration(hours: 2)));
              },
            ))
      ],
    );
  }
}