import 'dart:js';

import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'body.dart';
import 'schedule_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'hidukenyuuryoku_route.dart';
import 'dropdown_route.dart';
import 'package:provider/provider.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    final HidukeProvider countProvider =
        Provider.of<HidukeProvider>(context, listen: true);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            child: Row(children: <Widget>[
              Text((HidukeProvider.dateFormat)),
              IconButton(
                  onPressed: (() {
                    HidukeProvider.dateTime;
                  }),
                  icon: Icon(Icons.calendar_month_rounded))
            ]),
          ),
        ));
  }
}
