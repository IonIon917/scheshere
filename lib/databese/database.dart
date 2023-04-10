import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../schedule_route.dart';
import 'dao.dart';
import 'repository.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Schedules,
  ],
  daos: [
    ScheduleDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File.join(dbFolder.path, 'db.sqlite');
    return NativeDatabase(file);
  });
}

@DataClassName('ScheduleTable')
class Schedules extends Table {
  @override
  String? get tableName => 'Schedules';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  TextColumn get title => text()();
  TextColumn get type => text()();
  IntColumn get date => integer()();
}
