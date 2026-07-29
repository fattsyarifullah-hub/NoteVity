import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_providers.dart';
import '../../models/task_model.dart';
import 'priority_card.dart';
import 'package:intl/intl.dart';
import '../../utils/task_color.dart';
import 'package:google_fonts/google_fonts.dart';

class PriorityContainer extends StatefulWidget {
  const PriorityContainer({super.key});

  @override
  State<PriorityContainer> createState() => _PriorityContainerState();
}

class _PriorityContainerState extends State<PriorityContainer> {
  TaskPriority _selectedPriority = TaskPriority.high;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();

    final pendingTasks = provider.currentTask.where((task) {
      return !task.isCompleted && !task.isExpired;
    }).toList();

    final highCount = pendingTasks
        .where((p) => p.priority == TaskPriority.high)
        .length;
    final mediumCount = pendingTasks
        .where((p) => p.priority == TaskPriority.medium)
        .length;
    final lowCount = pendingTasks
        .where((p) => p.priority == TaskPriority.low)
        .length;

    final filteredTask = pendingTasks.where((task) {
      return task.priority == _selectedPriority;
    }).toList();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: PriorityCard(
                title: "High",
                count: highCount,
                priority: TaskPriority.high,
                isSelected: _selectedPriority == TaskPriority.high,
                cardColor: Colors.red[900]!,
                activeColor: Colors.red[400]!,
                onTap: () =>
                    setState(() => _selectedPriority = TaskPriority.high),
              ),
            ),
            Expanded(
              child: PriorityCard(
                title: "Medium",
                count: mediumCount,
                priority: TaskPriority.medium,
                isSelected: _selectedPriority == TaskPriority.medium,
                cardColor: Colors.blue[900]!,
                activeColor: Colors.blue[400]!,
                onTap: () =>
                    setState(() => _selectedPriority = TaskPriority.medium),
              ),
            ),
            Expanded(
              child: PriorityCard(
                title: "Low",
                count: lowCount,
                priority: TaskPriority.low,
                isSelected: _selectedPriority == TaskPriority.low,
                cardColor: Colors.green[900]!,
                activeColor: Colors.green[400]!,
                onTap: () =>
                    setState(() => _selectedPriority = TaskPriority.low),
              ),
            ),
          ],
        ),
        Expanded(
          child: filteredTask.isEmpty
              ? Center(
                  child: Text(
                    "Priority task ${_selectedPriority.name} ini sudah selesai",
                  ),
                )
              : ListView.builder(
                  itemCount: filteredTask.length,
                  itemBuilder: (context, index) =>
                      _priorityTaskTile(filteredTask[index]),
                ),
        ),
      ],
    );
  }

  Widget _priorityTaskTile(ActivityTask task) {
    final bool isDisable = task.isCompleted || task.isExpired;
    final cardColor = task.priority.realColor();
    final formattedDate = DateFormat("dd MMM yyyy, HH:mm").format(task.endTime);

    return Padding(
      padding: EdgeInsetsGeometry.only(top: 7.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(left: 7.5),
            child: SizedBox(
              width: 50.0,
              height: 25.0,
              child: Text(
                formattedDate,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border(left: BorderSide(color: cardColor, width: 10)),
              ),
              child: Container(
                margin: EdgeInsets.only(right: 15.0),
                padding: EdgeInsets.only(left: 15.0, right: 20.0),
                decoration: BoxDecoration(color: cardColor.withOpacity(0.3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        shadows: [
                          Shadow(
                            color: const Color.fromARGB(
                              255,
                              242,
                              240,
                              240,
                            ).withOpacity(0.3),
                            offset: Offset(1, 3),
                          ),
                        ],
                        decoration: isDisable && task.isCompleted ? TextDecoration.lineThrough : null
                      ),
                    ),
                    InkWell(
                      onTap: isDisable && !task.isCompleted
                          ? null
                          : () {
                              context.read<TaskProvider>().toggleCompleted(
                                task,
                              );
                            },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: cardColor.withOpacity(0.7),
                            width: 3,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.0),
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
          ),
        ],
      ),
    );
  }
}
