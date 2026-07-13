// ## FILE UNTUK MELAKSANAKAN QUERY DATABASE ISAR ##

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/task_model.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([ActivityTaskSchema], directory: dir.path);
    }
    return Isar.getInstance()!;
  }

  Future<void> insertTask(ActivityTask task) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.activityTasks.put(task);
    });
  }

  Future<List<ActivityTask>> getTaskByDate(DateTime date) async {
    final isar = await db;
    final startDay = DateTime(date.year, date.month, date.day, 0, 0, 0);
    final endDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return await isar.activityTasks
    .filter()
    .endTimeGreaterThan(startDay)
    .endTimeLessThan(endDay)
    .sortByEndTime()
    .findAll();
  }

  Future<void> updateTaskStatus(ActivityTask task) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.activityTasks.put(task);
    });
  }

  Future<void> deleteTask(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.activityTasks.delete(id);
    });
  }
}
