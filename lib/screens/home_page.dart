import 'package:flutter/material.dart';
import '../widgets/HomeWidget/daily_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 10.0),
      child: DailyTask(),
    );
  }
}
