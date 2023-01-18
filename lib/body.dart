import 'package:flutter/material.dart';
import 'package:scheshere/schedule-create_route.dart';
import 'main_route.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import 'schedule-create_route.dart';
import 'schedule_route.dart';

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: const <Widget>[
        Center(
          child: Schedule(),
        ),
        Center(
          child: ScheduleII(),
        ),
      ],
    );
  }
}
