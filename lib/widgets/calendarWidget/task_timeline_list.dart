import 'package:flutter/material.dart';
import 'package:notevity/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import '../../providers/task_providers.dart';
import 'empty_time.dart';

class TaskTimelineList extends StatelessWidget {
  final int startHour;
  final int endHour;

  const TaskTimelineList({super.key, this.startHour = 1, this.endHour = 23});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().currentTask;

    final totalHours = endHour - startHour + 1;

    return Expanded(
      child: ListView.builder(
        itemCount: totalHours,
        itemBuilder: (context, index) {
          final currentHour = startHour + index;
          final matchingHour = tasks.where((task) {
            return task.endTime.hour == currentHour;
          }).toList();

          if (matchingHour.isEmpty) {
            return EmptyTime(hour: currentHour);
          }

          return Column(
            children: matchingHour.map((task) {
              return TaskTile(task: task);
            }).toList(),
          );
        },
      ),
    );
  }
}
