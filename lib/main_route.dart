import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'package:scheshere/header.dart';
import 'package:scheshere/schedule_repository.dart';

import 'header.dart';
import 'body.dart';
import 'schedule_route.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scheshere/create_route.dart';
import 'package:scheshere/delete_route.dart';

class Main extends StatelessWidget {
  const Main({
    super.key,
    required this.scheduleRepository,
  });
  final ScheduleRepository scheduleRepository;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
      ],
      title: 'ScheShare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: MyAppBar(),
        body: MyBody(scheduleRepository: scheduleRepository),
      ),
    );
  }
}
