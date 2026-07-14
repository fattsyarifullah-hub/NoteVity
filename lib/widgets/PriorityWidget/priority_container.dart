import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_providers.dart';
import '../../models/task_model.dart';
import 'priority_card.dart';
import 'package:intl/intl.dart';

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
    final formattedDate = DateFormat("dd MMM yyyy, HH:mm").format(task.endTime);

    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(task.title),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  Text("Deadline ${formattedDate}"),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () => context.read<TaskProvider>().toggleCompleted(task),
            icon: Icon(Icons.circle_outlined),
          ),
        ],
      ),
    );
  }
}
