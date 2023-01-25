import 'dart:async';

import 'package:isar/isar.dart';

import 'collections/calendar.dart';
import 'collections/category.dart';
import 'collections/schedule.dart';

/// スケジュールリポジトリ
///
/// スケジュールに関する操作はこのクラスを経由して行う
class ScheduleRepository {
  ScheduleRepository(this.isar) {
    // メモ一覧の変化を監視してストリームに流す
    isar.schedules.watchLazy().listen((_) async {
      if (!isar.isOpen) {
        return;
      }
      if (_scheduleStreamController.isClosed) {
        return;
      }
      _scheduleStreamController.sink.add(await findSchedule());
    });
  }

  /// Isarインスタンス
  final Isar isar;

  /// メモ一覧を監視したい場合はscheduleStreamをlistenしてもらう
  final _scheduleStreamController =
      StreamController<List<Schedule>>.broadcast();
  Stream<List<Schedule>> get scheduleStream => _scheduleStreamController.stream;

  /// 終了処理
  void dispose() {
    _scheduleStreamController.close();
  }

  /// カテゴリを検索する
  Future<List<Category>> findCategories() async {
    if (!isar.isOpen) {
      return [];
    }

    // デフォルトのソートはidの昇順
    return isar.categorys.where().findAll();
  }

  /// メモを検索する
  Future<List<Schedule>> findSchedule() async {
    if (!isar.isOpen) {
      return [];
    }

    // 更新日時の降順で全件返す
    final schedules =
        await isar.schedules.where().sortByUpdatedAtDesc().findAll();

    // IsarLinkでリンクされているカテゴリを読み込む必要がある
    for (final schedule in schedules) {
      await schedule.category.save();
      await schedule.calendar.save();
    }
    return schedules;
  }

  /// メモを追加する
  Future<void> addSchedule({
    required Category category,
    required Calendar calendar,
    required String title,
    required String place,
  }) {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    final now = DateTime.now();
    final schedule = Schedule()
      ..category.value = category
      ..calendar.value = calendar
      ..title = title
      ..place = place
      ..createdAt = now
      ..updatedAt = now;
    return isar.writeTxn(() async {
      await isar.schedules.put(schedule);

      // IsarLinkでリンクされているカテゴリを保存する必要がある
      await schedule.category.save();
      await schedule.calendar.save();
    });
  }

  /// メモを更新する
  Future<void> updateSchedule({
    required Schedule schedule,
    required Category category,
    required Calendar calendar,
    required String title,
    required String place,
  }) {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    final now = DateTime.now();
    schedule
      ..category.value = category
      ..calendar.value = calendar
      ..title = title
      ..place = place
      ..updatedAt = now;
    return isar.writeTxn(() async {
      await isar.schedules.put(schedule);
      await isar.schedules.put(schedule);

      // IsarLinkでリンクされているカテゴリを保存する必要がある
      await schedule.category.save();
      await schedule.calendar.save();
    });
  }

  /// メモを削除する
  Future<bool> deleteSchedule(Schedule schedule) async {
    if (!isar.isOpen) {
      return false;
    }

    return isar.writeTxn(() async {
      return isar.schedules.delete(schedule.id);
    });
  }
}
