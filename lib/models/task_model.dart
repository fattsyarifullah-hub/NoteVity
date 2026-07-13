// ## FILE UNTUK BLUEPRINT DARI NOTE TASK ##

import 'package:isar/isar.dart';

part 'task_model.g.dart';

enum TaskPriority { high, medium, low }
enum ColorHex {red, yellow, green }

@collection
class ActivityTask {
  Id id = Isar.autoIncrement;

  late String title;

  @Enumerated(EnumType.name)
  late ColorHex color;

  @Enumerated(EnumType.name)
  late TaskPriority priority;

  late bool isCompleted;

  late bool isExpired;

  late DateTime endTime;

  ActivityTask();
}
