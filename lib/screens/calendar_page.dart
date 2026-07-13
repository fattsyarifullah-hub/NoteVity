import 'package:flutter/material.dart';
import 'package:notevity/models/task_model.dart';
import 'package:notevity/widgets/calendar_horizontal.dart';
import 'package:notevity/widgets/task_timeline_list.dart';
import '../widgets/dropdown_month.dart';
import '../widgets/popup_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownMonth(),
          SizedBox(height: 10,),
          CalendarHorizontal(),
          SizedBox(height: 5,),
          TaskTimelineList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return PopupCalendar();
          },
        ),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
