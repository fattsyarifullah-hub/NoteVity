import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_providers.dart';

class DropdownMonth extends StatelessWidget {
  const DropdownMonth({super.key});

  static const List<String> _Month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();
    final currentMonth = provider.selectedMonth;

    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          icon: Icon(Icons.keyboard_arrow_down),
          dropdownColor: Color.fromARGB(255, 224, 180, 241),
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          value: currentMonth,
          items: List.generate(12, (index) {
            return DropdownMenuItem<int>(
              value: index + 1,
              child: Text(_Month[index]),
            );
          }),
          onChanged: (int? newMonth) {
            if (newMonth != null) {
              context.read<TaskProvider>().changeMonth(newMonth);
            }
          },
        ),
      ),
    );
  }
}
