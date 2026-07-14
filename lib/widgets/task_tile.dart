import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/task_model.dart';
import '../utils/task_color.dart';
import '../providers/task_providers.dart';

class TaskTile extends StatelessWidget {
  final ActivityTask task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat("HH.mm").format(task.endTime);

    final cardColor = task.priority.realColor();

    final bool isDisable = task.isCompleted || task.isExpired;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
      child: Row(
        children: [
          SizedBox(width: 50, child: Text(timeFormat)),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: isDisable ? cardColor.withOpacity(0.5) : cardColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                    )
                    ),
                  InkWell(
                    onTap: isDisable && !task.isCompleted
                        ? null
                        : () {
                            context.read<TaskProvider>().toggleCompleted(task);
                          },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3
                        ),
                        color: task.isCompleted
                            ? cardColor.withOpacity(0.5)
                            : cardColor,
                      ),
                      child: task.isCompleted
                          ? Icon(Icons.check, size: 20, color: Colors.white)
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
