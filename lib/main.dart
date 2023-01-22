import 'package:flutter/material.dart';
import 'package:scheshere/login_route.dart';
import 'package:scheshere/top_route.dart';
import 'package:scheshere/main_route.dart';
import 'top_route.dart';
import 'main_route.dart';
import 'package:isar/isar.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => top_route(),
        '/login': (context) => login_route(),
        '/main': (context) => main_route(),
      },
    );
  }
}
