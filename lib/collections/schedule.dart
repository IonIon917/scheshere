import 'package:isar/isar.dart';
import 'category.dart';
import 'calendar.dart';

part 'schedule.g.dart';

@Collection()
class ClassName {
  //ID
  Id id = Isar.autoIncrement;
  //カテゴリ
  final category = IsarLink<Category>();
  //タイトル
  late String title;
  //場所
  late String place;
  //日時
  final calendar = IsarLink<Calendar>();
}
