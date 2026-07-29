import 'package:flutter/material.dart';
import 'package:notevity/models/task_model.dart';
import 'package:google_fonts/google_fonts.dart';

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
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 150.0,
        height: 50.0,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: isSelected ? activeColor : cardColor,
              ),
            ),
            Text(
              "$count",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: isSelected ? activeColor : cardColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
