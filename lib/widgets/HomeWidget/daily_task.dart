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
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 7.5, bottom: 10.0),
            child: Text(
              "Overview",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(
                      255,
                      171,
                      170,
                      170,
                    ).withOpacity(0.3),
                    offset: Offset(3, 8),
                  ),
                ],
                color: Color.fromARGB(255, 215, 154, 237)
              ),
            ),
          ),
        ),
        Container(
          width: 450.0,
          height: 125.0,
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              buildCard(
                iconcard: Icons.sync,
                title: "Progress",
                count: onProgressCount,
                color: Colors.green,
              ),
              SizedBox(width: 15.0),
              buildCard(
                iconcard: Icons.check_circle_outline_outlined,
                title: "Completed",
                count: isDoneCount,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(7.0, 15.0, 0, 15.0),
            child: Text(
              "Your Task Today",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(
                      255,
                      171,
                      170,
                      170,
                    ).withOpacity(0.3),
                    offset: Offset(3, 8),
                  ),
                ],
                color: Color.fromARGB(255, 215, 154, 237)
              ),
            ),
          ),
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
