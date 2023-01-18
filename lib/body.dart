import 'package:flutter/material.dart';
import 'main_route.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LiquidSwipeSample(),
    );
  }
}

class LiquidSwipeSample extends StatelessWidget {
  const LiquidSwipeSample({Key? key}) : super(key: key);

  static List<Widget> pages = <Widget>[
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
      ),
    );
  }
}
