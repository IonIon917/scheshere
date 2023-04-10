import 'package:flutter/material.dart';
import 'package:scheshere/create_route.dart' as auth;
import 'package:scheshere/main_route.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import 'package:scheshere/schedule_route.dart' as auth;
import 'package:scheshere/delete_route.dart';
import 'package:scheshere/databese/database.dart';

class MyBody extends StatelessWidget {
  MyBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: <Widget>[
        Center(
          child: auth.ScheduleRoute(),
        ),
        Center(
          child: auth.Create(),
        ),
        Center(
          child: Delete(),
        )
      ],
    );
  }
}
