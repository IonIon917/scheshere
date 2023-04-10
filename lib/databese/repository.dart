import 'dart:ffi';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'database.dart';
import 'dao.dart';
import 'dataSource.dart';

class ScheduleRepository {
  const ScheduleRepository(this._dataSource);

  final ScheduleDatabaseDataSource _dataSource;

  Future<List<Schedules>> getAllSchedule() async {
    return await _dataSource.getAllSchedules();
  }

  Future<void> addSchedule({
    required Schedules schedule,
  }) async {
    return _dataSource.addSchedule(schedule);
  }
}
