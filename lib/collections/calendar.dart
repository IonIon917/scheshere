import 'dart:ffi';

import 'package:isar/isar.dart';

@Collection()
class Calendar {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  /// カテゴリ名
  late Int date;
}
