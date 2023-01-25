import 'package:isar/isar.dart';

import 'category.dart';
import 'calendar.dart';

part 'schedule.g.dart';

@Collection()
class Schedule {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  /// カテゴリ
  final category = IsarLink<Category>();

  ///日時
  final calendar = IsarLink<Calendar>();

  /// タイトル
  late String title;

  ///場所
  late String place;

  /// 作成日時
  late DateTime createdAt;

  /// 更新日時
  @Index()
  late DateTime updatedAt;
}
