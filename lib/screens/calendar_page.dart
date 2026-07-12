import 'package:flutter/material.dart';
import 'home_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  void showTestPop() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text("Test Pop Up")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Ini Ca Page")),
      floatingActionButton: FloatingActionButton(
        onPressed: showTestPop,
        child: Icon(Icons.navigation),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
