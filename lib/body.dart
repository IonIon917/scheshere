import 'package:flutter/material.dart';
import 'package:scheshere/create_route.dart' as auth;
import 'main_route.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import 'package:scheshere/schedule_route.dart';
import 'package:scheshere/delete_route.dart';
import 'schedule_repository.dart';

class MyBody extends StatelessWidget {
  const MyBody({
    super.key,
    required this.scheduleRepository,
  });

  /// メモリポジトリ
  final ScheduleRepository scheduleRepository;

  @override
  Widget build(BuildContext context) {
    ;
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: <Widget>[
        Center(
          child: Schedule(),
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
