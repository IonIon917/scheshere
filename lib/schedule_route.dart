import 'package:flutter/material.dart';
import 'body.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import 'main_route.dart';

import 'package:scheshere/databese/database.dart';

class ScheduleRoute extends StatefulWidget {
  const ScheduleRoute({
    Key? key,
    required this.database,
  }) : super(key: key);

  final ScheduleDatabase database;

  @override
  State<ScheduleRoute> createState() => _Schedule();
}

class _Schedule extends State<ScheduleRoute> {
  final database = ScheduleDatabase();

  @override
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: StreamBuilder(
        stream: database.watchEntries(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Schedule>> snapshot) {
          return TableCalendar(
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.utc(2050, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              });
        },
      ))
    ]));
  }
}
