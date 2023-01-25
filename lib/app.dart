import 'package:flutter/material.dart';

import 'create_route.dart';
import 'delete_route.dart';
import 'schedule_route.dart';
import 'schedule_repository.dart';

import 'top_route.dart';
import 'main_route.dart';
import 'login_route.dart';

/// メモアプリ
class App extends StatelessWidget {
  const App({
    super.key,
    required this.scheduleRepository,
  });

  /// メモリポジトリ
  final ScheduleRepository scheduleRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Top(scheduleRepository: scheduleRepository),
        '/login': (context) => Login(scheduleRepository: scheduleRepository),
        '/main': (context) => Main(scheduleRepository: scheduleRepository),
      },
    );
  }
}
