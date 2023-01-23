import 'dart:async';

import 'package:isar/isar.dart';
import 'package:scheshere/collections/calendar.dart';
import 'package:scheshere/schedule_route.dart';

import 'collections/category.dart';
import 'collections/schedule.dart';
import 'collections/calendar.dart';


///スケジュールリポジトリ
///
///スケジュールに関する処理はここを通る

class ScheduleRepository { ScheduleRepository(this.isar) {
    // メモ一覧の変化を監視してストリームに流す
    isar.schedules.watchLazy().listen((_) async {
      if (!isar.isOpen) {
        return;
      }
      if (_sceduleStreamController.isClosed) {
        return;
      }
      _sceduleStreamController.sink.add(await findSchedules());
    });
  }

  /// Isarインスタンス
  final Isar isar;

  /// メモ一覧を監視したい場合はmemoStreamをlistenしてもらう
  final _sceduleStreamController = StreamController<List<Schedule>>.broadcast();
  Stream<List<Schedule>> get scheduleStream => _sceduleStreamController.stream;

  /// 終了処理
  void dispose() {
    _sceduleStreamController.close();
  }

  /// カテゴリを検索する
  Future<List<Category>> findCategories() async {
    if (!isar.isOpen) {
      return [];
    }

    // デフォルトのソートはidの昇順
    return isar.categorys.where().findAll();
  }



    // IsarLinkでリンクされているカテゴリを読み込む必要がある
    for (final schedule in schedules) {
      await schedule.category.load();
    }
    return schedules;
  }

  /// メモを追加する
  Future<void> addSchedule({
    required Category category,
    required String place,
    required String title,
    required Calendar calendar,

  }) {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    final now = DateTime.now();
    final memo = Schedule()
      ..category.value = category
      ..title = title
      ..place = place
      
    return isar.writeTxn(() async {
      await isar.schedules.put(memo);

      // IsarLinkでリンクされているカテゴリを保存する必要がある
      await memo.category.save();
    });
  }

  /// メモを更新する
  Future<void> updateMemo({
    required Schedule schedule,
    required Category category,
    required String title,
    required String place,
    required Calendar calendar,
  }) {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    final now = DateTime.now();
    schedule
      ..category.value = category
      title = title
      place = place
      calendar =calendar
    return isar.writeTxn(() async {
      await isar.memos.put(schedule);

      // IsarLinkでリンクされているカテゴリを保存する必要がある
      await schedule.category.save();
    });
  }

  /// メモを削除する
  Future<bool> deleteMemo(Schedule schedule) async {
    if (!isar.isOpen) {
      return false;
    }

    return isar.writeTxn(() async {
      return isar.schedules.delete(schedule.id);
    });
  }

