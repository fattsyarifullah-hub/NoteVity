// ## FILE UNTUK WIDGET BOTTOM NAVIGATION ##

import 'package:flutter/material.dart';


class bottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const bottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calendar"),
        BottomNavigationBarItem(icon: Icon(Icons.low_priority_outlined), label: "Priority")
      ]
    );
  }
}