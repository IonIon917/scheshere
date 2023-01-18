import 'package:flutter/material.dart';
import 'main_route.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBody();
}

class _MyBody extends State<MyBody> {
  @override
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime, List> _eventsList = {};

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
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    return Scaffold(
        body: Column(children: [
      TableCalendar(
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
          })
    ]));
  }
}
