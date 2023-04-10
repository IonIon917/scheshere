import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:scheshere/databese/database.dart';
import 'package:scheshere/schedule_route.dart';
import 'dao.dart';
import 'repository.dart';

class ScheduleDatabaseDataSource {
  const ScheduleDatabaseDataSource(this._database);

  final AppDatabase _database;

  Future<List<Schedules>> getAllSchedules() async {
    final localSchedules = await _database.scheduleDao.getAllSchedules();
    return localSchedules
        .map((e) => Schedules(
              id: e.id,
              content: e.content,
              title: e.title,
              type: e.type,
              date: e.type,
            ))
        .toList();
  }

  Future<void> addSchedule(Schedules schedule) async {
    final insertableSchedule = SchedulesCompanion(
      date: Value(schedule.date),
      type: Value(schedule.type),
      title: Value(schedule.title),
      content: Value(schedule.content),
      id: Value(schedule.id),
    );
    return await _database.scheduleDao
        .insertSchedule(schedule: insertableSchedule);
  }
}
