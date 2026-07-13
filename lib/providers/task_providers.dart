// ## FILE UNTUK FUNCTION FUNCTION YANG AKAN DIGUNAKAN ##

import 'package:flutter/material.dart';
import '../database/isar_service.dart';
import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final IsarService _isarService = IsarService();

  List<ActivityTask> _currentTask = [];
  DateTime _selectedDate = DateTime.now();
  int _selectedMonth = DateTime.now().month;

  // List<ActivityTask> get currentTask => _currentTask;
  List<ActivityTask> get currentTask {
    return _currentTask.where((task) {
      final bool isCompleted = task.isCompleted;
      final bool isDone = task.isExpired;

      return !isCompleted && !isDone;
    }).toList();
  }

  DateTime get selectedDate => _selectedDate;
  int get selectedMonth => _selectedMonth;

  void changeMonth(int month) {
    _selectedMonth = month;
    _selectedDate = DateTime(_selectedDate.year, month, 1);
    refreshTasks();
  }

  void changeDate(DateTime date) {
    _selectedDate = date;
    refreshTasks();
  }

  Future<void> refreshTasks() async {
    final now = DateTime.now();
    final tasks = await _isarService.getTaskByDate(_selectedDate);

    for (var rowtask in tasks) {
      if (now.isAfter(rowtask.endTime) && !rowtask.isCompleted) {
        if (!rowtask.isExpired) {
          _isarService.updateTaskStatus(rowtask);
        }
      }
    }

    _currentTask = tasks;
    notifyListeners();
  }

  Future<void> createNewTask(
    String title,
    ColorHex color,
    TaskPriority priority,
    DateTime end,
  ) async {
    final task = ActivityTask()
      ..title = title
      ..color = color
      ..priority = priority
      ..endTime = end
      ..isCompleted = false
      ..isExpired = false;

    await _isarService.insertTask(task);
    await refreshTasks();
  }

  Future<void> toggleCompleted(ActivityTask task) async {
    task.isCompleted = !task.isCompleted;

    if (task.isCompleted) {
      task.isExpired;
    }

    await _isarService.updateTaskStatus(task);
    await refreshTasks();
  }
}
