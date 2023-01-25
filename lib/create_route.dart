import 'package:flutter/material.dart';

import 'main_route.dart';
import 'body.dart';
import 'schedule_route.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'collections/schedule.dart' as sch;
import 'collections/calendar.dart';
import 'collections/category.dart';
import 'schedule_repository.dart';

class Create extends StatefulWidget {
  const Create(
    this.scheduleRepository, {
    super.key,
    this.schedule,
  });

  final ScheduleRepository scheduleRepository;
  final sch.Schedule? schedule;

  @override
  State<Create> createState() => _Create();
}

class _Create extends State<Create> {
  //表示するカテゴリ一覧
  final categories = <Category>[];
  //選択中のカテゴリ
  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;

  //入力中のスケジュール
  final _titleController = TextEditingController();
  String get title => _titleController.text;
  final _placeController = TextEditingController();
  String get place => _placeController.text;

  //日付
  dynamic dateTime;
  dynamic dateFormat;

  @override
  void initState() {
    super.initState();
    //今日の日付の取得
    dateTime = DateTime.now();
    dateFormat = DateFormat("yyyy年MM月dd日").format(dateTime);

    () async {
      // カテゴリ一覧を取得する
      categories.addAll(await widget.scheduleRepository.findCategories());

      // 初期値を設定する
      _selectedCategory = categories.firstWhere(
        (category) => category.id == widget.schedule?.category.value?.id,
        orElse: () => categories.first,
      );
      _titleController.text = widget.schedule?.title ?? '';
      _placeController.text = widget.schedule?.place ?? '';

      // 再描画する
      setState(() {});
    }();
  }

  //日付取得DatePicker
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
            DropdownButton<Category>(
              value: _selectedCategory,
              items: categories
                  .map(
                    (category) => DropdownMenuItem<Category>(
                      value: category,
                      child: Text(category.name),
                    ),
                  )
                  .toList(),
              onChanged: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
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
            labelText: '内容',
            labelStyle: TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.white,
          )),
          IconButton(onPressed: (() {}), icon: Icon(Icons.edit)),
        ]));
  }
}
