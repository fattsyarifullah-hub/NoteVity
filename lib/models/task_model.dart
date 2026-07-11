// ## FILE UNTUK BLUEPRINT DARI NOTE TASK ##

import 'package:isar/isar.dart';

part 'task_model.g.dart';

enum TaskPriority { high, medium, low }

@collection
class ActivityTask {
  Id id = Isar.autoIncrement;

  late String title;

  late String color;

  @Enumerated(EnumType.name)
  late TaskPriority priority;

  late bool isCompleted;

  late bool isExpired;

  late DateTime startTime;

  late DateTime endTime;

  ActivityTask();
}
