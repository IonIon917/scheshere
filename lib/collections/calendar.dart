import 'package:isar/isar.dart';

part 'calendar.g.dart';

@Collection()
class Calendar {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  /// カテゴリ名
  late String name;
}
