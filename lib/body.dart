import 'package:flutter/material.dart';

import 'package:scheshere/schedule_repository.dart';

import 'package:scheshere/schedule_route.dart';

import 'main_route.dart';
import 'create_route.dart';
import 'delete_route.dart';
import 'schedule_route.dart';

class MyBody extends StatelessWidget {
  const MyBody({
    super.key,
    required this.scheduleRepository,
  });
  final ScheduleRepository scheduleRepository;
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: <Widget>[
        Center(
          child: Schedule(),
        ),
        Center(
          child: Create(scheduleRepository),
        ),
        Center(
          child: Delete(),
        )
      ],
    );
  }
}
