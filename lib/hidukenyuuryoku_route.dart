import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'body.dart';
import 'schedule_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'create_route.dart';
import 'package:provider/provider.dart';

class HidukeProvider with ChangeNotifier {
  @override
  dynamic dateTime;
  dynamic dateFormat;

  void initState() {
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
      dateTime = datePicked;
      dateFormat = DateFormat("yyyy年MM月dd日").format(dateTime);
    }
  }

  notifyListeners();
}
