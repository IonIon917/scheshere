import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'package:scheshere/header.dart';
import 'header.dart';
import 'body.dart';

main_route() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScheShare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: MyAppBar(),
        body: MyBody(),
      ),
    );
  }
}
