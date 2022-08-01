import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';

void main_route() {
  runApp(const MainRoute());
}

class MainRoute extends RenderObjectWidget {
  Scaffold(
    appBar: AppBar(
      groupName: Text("tentative")),
  ),
}
