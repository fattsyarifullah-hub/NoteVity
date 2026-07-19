// ## FILE UNTUK WIDGET BOTTOM NAVIGATION ##

import 'package:flutter/material.dart';

class bottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const bottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color.fromARGB(58, 77, 69, 69),
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      indicatorColor: Colors.blueAccent.withOpacity(0.7),
      height: 65.0,
      elevation: 6.0,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: Colors.black),
          selectedIcon: Icon(Icons.home, color: Colors.white),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined, color: Colors.black),
          selectedIcon: Icon(Icons.calendar_month, color: Colors.white),
          label: "Calendar",
        ),
        NavigationDestination(
          icon: Icon(Icons.low_priority_outlined, color: Colors.black),
          selectedIcon: Icon(Icons.low_priority, color: Colors.white),
          label: "Priority",
        ),
      ],
    );
  }
}
