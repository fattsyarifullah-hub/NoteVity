import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notevity/screens/calendar_page.dart';
import 'package:notevity/screens/home_page.dart';
import 'package:notevity/screens/priority_page.dart';
import 'package:notevity/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'providers/task_providers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider()..refreshTasks(),
      child: const NoteVity(),
    ),
  );
}

class NoteVity extends StatelessWidget {
  const NoteVity({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteVity',
      home: const MainApp(title: 'NoteVity'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key, required this.title});

  final String title;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomePage(), CalendarPage(), PriorityPage()];

  void _NavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NoteVity", style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 215, 154, 237),
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: bottomNav(
        currentIndex: _currentIndex,
        onTap: _NavTapped,
      ),
    );
  }
}
