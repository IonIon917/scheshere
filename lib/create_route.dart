import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'body.dart';
import 'schedule_route.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _Create();
}

class _Create extends State<Create> {
  dynamic dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
  }

  _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2050));
    if (datePicked != null && datePicked != dateTime) {
      setState(() {
        dateTime = datePicked;
      });
    }
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(children: <Widget>[
            Text(("$dateTime")),
            IconButton(
                onPressed: (() {
                  _datePicker(context);
                }),
                icon: Icon(Icons.calendar_month_rounded))
          ]),
        ),
      ),
    );
  }
}
