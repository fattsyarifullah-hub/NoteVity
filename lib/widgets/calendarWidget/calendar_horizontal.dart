import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_providers.dart';

class CalendarHorizontal extends StatelessWidget {
  const CalendarHorizontal({super.key});

  static const List<String> _weekdays = [
    '',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

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

          final currentDayName = DateTime(
            currentYear,
            selectedMonth,
            dayNumber,
          );

          final dayName = _weekdays[currentDayName.weekday];

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
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 25,
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                color: isSelected
                    ? Color.fromARGB(255, 215, 154, 237)
                    : Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border(
                  bottom: BorderSide(
                    width: 10.0,
                    color: isSelected
                        ? Colors.white
                        : Color.fromARGB(255, 215, 154, 237),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '$dayNumber',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    dayName,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
