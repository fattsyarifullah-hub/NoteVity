import 'package:flutter/material.dart';
import 'package:notevity/models/task_model.dart';
import 'priority_container.dart';

class PriorityCard extends StatelessWidget {
  final String title;
  final int count;
  final TaskPriority priority;
  final bool isSelected;
  final Color cardColor;
  final Color activeColor;
  final VoidCallback onTap;

  const PriorityCard({
    super.key,
    required this.title,
    required this.count,
    required this.priority,
    required this.isSelected,
    required this.cardColor,
    required this.activeColor,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : cardColor
        ),
        child: Column(
          children: [
            Text(title),
            Text("$count")
          ],
        ),
      ),
    );
  }
}
