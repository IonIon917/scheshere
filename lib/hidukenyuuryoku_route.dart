import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'body.dart';
import 'schedule_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class Hiduke extends StatefulWidget {
  const Hiduke({Key? key}) : super(key: key);

  @override
  State<Hiduke> createState() => _Hiduke();
}

class _Hiduke extends State<Hiduke> {
  dynamic dateTime;
  dynamic dateFormat;

  void initState() {
    super.initState();
    dateTime = DateTime.now();
    dateFormat = DateFormat("yyyy年MM月dd日").format(dateTime);
  }

  @override
  _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        locale: const Locale("ja"),
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2050));
    if (datePicked != null && datePicked != dateTime) {
      setState(() {
        dateTime = datePicked;
      });
    }
    dateFormat = DateFormat("yyyy年MM月dd日").format(dateTime);
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            child: Row(children: <Widget>[
              Text(("$dateFormat")),
              IconButton(
                  onPressed: (() {
                    _datePicker(context);
                  }),
                  icon: Icon(Icons.calendar_month_rounded))
            ]),
          ),
        ));
  }
}
