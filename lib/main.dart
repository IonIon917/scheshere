import 'package:flutter/material.dart';
import 'package:scheshere/login_route.dart';
import 'package:scheshere/top_route.dart';
import 'package:scheshere/main_route.dart';

import 'collections/calendar.dart';
import 'collections/category.dart';
import 'collections/schedule.dart';
import 'package:isar/isar.dart';
import 'schedule_repository.dart';

import 'package:flutter/foundation.dart' as foundation;
import 'package:path_provider/path_provider.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = '';
  if (!foundation.kIsWeb) {
    final dir = await getApplicationSupportDirectory();
    path = dir.path;
  }

  final isar = await Isar.open(
    [
      CategorySchema,
      ScheduleSchema,
      CalendarSchema,
    ],
    directory: path,
  );

  await _writeSeedIfNeed(
    isar,
    // force: true,
  );

  // await _experiments(isar);

  runApp(
    App(
      scheduleRepository: ScheduleRepository(
        isar,
        // sync: true,
      ),
    ),
  );
}

//初期データ
Future<void> _writeSeedIfNeed(
  Isar isar, {
  bool force = false,
}) async {
  if (force) {
    // 強制的にデータを全削除する
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }

  // データがあれば何もしない
  if (await isar.categorys.count() > 0) {
    return;
  }

  // 初期データを書き込む
  await isar.writeTxn(() async {
    // カテゴリの初期データ
    await isar.categorys.putAll(
      ['Live', '練習', 'レコーディング', '会議']
          .map((name) => Category()..name = name)
          .toList(),
    );
  });
  final categories = await isar.categorys.where().findAll();
}
