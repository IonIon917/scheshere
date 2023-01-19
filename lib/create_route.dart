import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'body.dart';
import 'schedule_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'hidukenyuuryoku_route.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _Create();
}

class _Create extends State<Create> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          child: Hiduke(),
        ),
      ),
    );
  }
}
