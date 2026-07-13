import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../providers/task_providers.dart';

class CalendarHorizontal extends StatelessWidget {
  const CalendarHorizontal({super.key});

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();
    final selectedDate = provider.selectedDate;
    final selectedMonth = provider.selectedMonth;
    final currentYear = selectedDate.year;

    final totalDays = _getDaysInMonth(currentYear, selectedMonth);

    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: totalDays,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final dayNumber = index + 1;

          final isSelected =
              dayNumber == selectedDate.day &&
              selectedMonth == selectedDate.month;

          return GestureDetector(
            onTap: () {
              final newSelectedDate = DateTime(
                currentYear,
                selectedMonth,
                dayNumber,
              );

              context.read<TaskProvider>().changeDate(newSelectedDate);
            },
            child: AnimatedContainer(
              width: 50,
              height: 25,
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.white,
              ),
              child: Center(
                child: Text(
                  '$dayNumber',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
