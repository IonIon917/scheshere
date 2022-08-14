import 'dart:html';

import 'package:flutter/material.dart';
import 'package:scheshere/top_route.dart';
import 'top_route.dart';

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
      },
    );
  }
}
