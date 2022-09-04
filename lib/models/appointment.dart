import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final List<Appointment> meetings = <Appointment>[];

List<Appointment> getDataSource() {
  return meetings;
}

void addAppoinment(Appointment appointment) {
  meetings.add(appointment);
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
