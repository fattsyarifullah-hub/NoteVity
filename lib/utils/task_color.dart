import 'package:flutter/material.dart';
import '../models/task_model.dart';

extension TaskColorX on TaskPriority {
  Color realColor() {
    switch (this) {
      case TaskPriority.high:
        return Colors.red;
      case TaskPriority.medium:
        return Colors.blue;
      case TaskPriority.low:
        return Colors.green;
    }
  }
}
