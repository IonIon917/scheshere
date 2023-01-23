import 'package:flutter/material.dart';
import 'package:scheshere/collections/category.dart';
import 'package:scheshere/main_route.dart';
import 'body.dart';
import 'schedule_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'collections/schedule.dart';
import 'collections/calendar.dart';
import 'schedule_repository.dart';

class Create extends StatefulWidget {
  const Create(
    this.scheduleRepository, {
    super.key,
    this.schedule,
  });

  final ScheduleRepository scheduleRepository;
  final Schedule? schedule;

  @override
  State<Create> createState() => _Create();
}

class _Create extends State<Create> {

///スケジュールカテゴリのコード
  //表示するカテゴリ
  final categories = <Category>[];
  //選択中のカテゴリ
  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;
//入力中のスケジュールコンテンツ
  final _textController = TextEditingController();
  String get content => _textController.text;
  //日付入力のコード
  dynamic dateTime;
  dynamic dateFormat;

  @override
  void initState() {
    super.initState();
    //初期表示日付の設定
    dateTime = DateTime.now();
    dateFormat = DateFormat("yyyy年MM月dd日").format(dateTime);

    () async {
      //カテゴリーの取得
      categories.addAll(await widget.scheduleRepository.findCategories());

      //初期値の設定
      _selectedCategory = categories.firstWhere(
        (category) => category.id == widget.schedule?.category.value?.id,
        orElse: () => categories.first,
      );
      //再描画する
      setState(() {});

    };
  }

  //カレンダーから日付入力
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
            value: _selectedCategory;
            items: categories
                .map(
                  (category) => DropdownMenuItem<Category>(
                      value: category,
                      child: Text(category.name),
                      ),
                      )
                      .toList(),
                      const SizedBox(
                        height: 32,);
              ],
              onChanged: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              }),
              )
              ),}
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
          IconButton(onPressed: (() {}), icon: Icon(Icons.edit))
          
  
  }

