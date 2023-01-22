import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'package:scheshere/header.dart';
import 'header.dart';
import 'body.dart';
import 'schedule_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scheshere/create_route.dart';
import 'package:scheshere/delete_route.dart';

main_route() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
