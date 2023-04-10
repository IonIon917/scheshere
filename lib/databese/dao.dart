import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'dataSource.dart';
import 'database.dart';
import 'repository.dart';

@DriftAccessor(tables: [Schedules])
class ScheduleDao extends DatabaseAccessor<AppDatabase> {
  ScheduleDao(AppDatabase db) : super(db);

  Future<List<ScheduleTable>> getAllSchedules() async {
    return select(schedules).get();
  }

  Future<void> insertSchedule({
    required Insertable<ScheduleTable> schedule,
  }) async {
    await batch((batch) {
      batch.insert(
        schedules,
        schedule,
        onConflict: DoUpdate(
          (_) => schedule,
          target: [
            schedule.date,
            schedule.type,
            schedule.title,
            schedule.content,
            schedule.id,
          ],
        ),
      );
    });
  }
}
