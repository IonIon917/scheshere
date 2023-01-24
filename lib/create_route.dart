import 'package:flutter/material.dart';
import 'package:scheshere/main_route.dart';
import 'body.dart';
import 'schedule_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _Create();
}

class _Create extends State<Create> {
  dynamic dateTime;
  dynamic dateFormat;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    dateFormat = DateFormat("yyyy年MM月dd日").format(dateTime);
  }

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
        dateFormat = DateFormat("yyyy年MM月dd日").format(dateTime);
      });
    }
  }

  String? isSelectedItem = 'Live';

  @override
  Widget build(BuildContext) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Row(children: <Widget>[
            Text("$dateFormat"),
            IconButton(
                onPressed: (() {
                  _datePicker(context);
                }),
                icon: Icon(Icons.calendar_month_rounded)),
            DropdownButton(
              items: [
                DropdownMenuItem(
                  child: Text('Live'),
                  value: 'Live',
                ),
                DropdownMenuItem(
                  child: Text('練習'),
                  value: '練習',
                ),
                DropdownMenuItem(
                  child: Text('レコーディング'),
                  value: 'レコーディング',
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  isSelectedItem = value;
                });
              },
              value: isSelectedItem,
            ),
            const SizedBox(
              height: 32,
            ),
          ]),
          TextField(
              decoration: InputDecoration(
            labelText: 'タイトル',
            labelStyle: TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.white,
          )),
          TextField(
              decoration: InputDecoration(
            labelText: '場所',
            labelStyle: TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.white,
          )),
          IconButton(onPressed: (() {}), icon: Icon(Icons.edit)),
        ]));
  }
}
