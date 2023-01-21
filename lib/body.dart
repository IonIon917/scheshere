import 'package:flutter/material.dart';
import 'package:scheshere/create_route.dart';
import 'main_route.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import 'schedule_route.dart';
import 'package:provider/provider.dart';

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HidukeProvider>(
            create: (context) => HidukeProvider(),
          ),
        ],
        final PageView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          controller: controller,
          children: const <Widget>[
            Center(
              child: Schedule(),
            ),
            Center(
              child: Create(),
            ),
          ],
        ));
  }
}
