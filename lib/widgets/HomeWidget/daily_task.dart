import 'package:flutter/material.dart';
import 'package:notevity/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import '../../providers/task_providers.dart';
import 'card_count_home.dart';

class DailyTask extends StatelessWidget {
  const DailyTask({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();
    final today = DateTime.now();

    final todayTask = provider.currentTask.where((task) {
      return task.endTime.year == today.year &&
          task.endTime.month == today.month &&
          task.endTime.day == today.day;
    }).toList();

    final onProgressCount = todayTask
        .where((progress) => !progress.isCompleted)
        .length;
    final isDoneCount = todayTask.where((done) => done.isCompleted).length;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5.0,
          children: [
            buildCard(
              title: "Progress",
              count: onProgressCount,
              color: Colors.green,
            ),
            buildCard(
              title: "Completed",
              count: isDoneCount,
              color: Colors.blue,
            ),
          ],
        ),
        Expanded(
          child: todayTask.isEmpty
              ? Center(child: Text("Tidak ada aktivitas untuk hari ini"))
              : ListView.builder(
                  itemCount: todayTask.length,
                  itemBuilder: (context, index) {
                    final dayTask = todayTask[index];
                    return TaskTile(task: dayTask);
                  },
                ),
        ),
      ],
    );
  }
}
