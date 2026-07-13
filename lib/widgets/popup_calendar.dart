import 'package:flutter/material.dart';
import '../providers/task_providers.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';

class PopupCalendar extends StatefulWidget {
  const PopupCalendar({super.key});

  @override
  State<PopupCalendar> createState() => _PopupCalendarState();
}

class _PopupCalendarState extends State<PopupCalendar> {
  final TextEditingController _titleController = TextEditingController();

  TaskPriority _selectedPriority = TaskPriority.medium;
  ColorHex _selectedColor = ColorHex.yellow;

  TimeOfDay _selectedEndTime = TimeOfDay.now();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedEndTime,
      initialEntryMode: TimePickerEntryMode.input
      
    );
    if (picked != null) {
      setState(() {
        _selectedEndTime = picked;
      });
    }
  }

  void submitData() {
    final titleText = _titleController.text.trim();

    final selectedDate = context.read<TaskProvider>().selectedDate;

    final endDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      _selectedEndTime.hour,
      _selectedEndTime.minute,
    );

    context.read<TaskProvider>().createNewTask(
      titleText,
      _selectedColor,
      _selectedPriority,
      endDateTime,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Note Activity"),
      content: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: "Masukin aktivitas LOH"),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text("Waktu"),
              OutlinedButton.icon(
                onPressed: () => _selectEndTime(context),
                icon: Icon(Icons.access_time),
                label: Text(_selectedEndTime.format(context)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text("Priority"),
          DropdownButton<TaskPriority>(
            value: _selectedPriority,
            isExpanded: true,
            items: TaskPriority.values
              .map((priority) {
                return DropdownMenuItem(
                  value: priority,
                  child: Text(priority.name),
                );
              }).toList(),
            onChanged: (val) {
              if (val != null)
                setState(() {
                  _selectedPriority = val;
                });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: Text("Batal")
        ),
        ElevatedButton(
          onPressed: () => submitData(), 
          child: Text("Simpan")
        )
      ],
    );
  }
}
