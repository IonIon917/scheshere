import 'package:flutter/material.dart';
import 'package:scheshere/login_route.dart';
import 'package:scheshere/schedule_route.dart';
import 'package:scheshere/top_route.dart';
import 'package:scheshere/main_route.dart';
import 'top_route.dart';
import 'main_route.dart';
import 'package:isar/isar.dart';
import 'schedule_repository.dart';
import 'create_route.dart';

import 'collections/calendar.dart';
import 'collections/schedule.dart';
import 'collections/category.dart';
import 'schedule_repository.dart';
import 'package:isar/isar.dart';
import 'package:flutter/foundation.dart' as foundation;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // メモリポジトリの初期化
  // path_provider は Web に非対応
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

  // 初期データ書き込み
  // forceプロパティをtrueにすると既存データを全削除して初期データを書き込み直す
  await _writeSeedIfNeed(
    isar,
    // force: true,
  );

  // await _experiments(isar);

  // syncプロパティをtrueにするとDB操作を同期的に処理する
  runApp(
    MyApp(
      scheduleRepository: ScheduleRepository(
        isar,
        // sync: true,
      ),
    ),
  );
}

/// 必要なら初期データを書き込む
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
    final categories = await isar.categorys.where().findAll();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => top_route(),
        '/login': (context) => login_route(),
        '/main': (context) => main_route(),
      },
    );
  }
}
