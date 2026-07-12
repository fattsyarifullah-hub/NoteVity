import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Text("Ini container 1"),),
        Container(child: Text("Ini container 2"),),
        Container(child: Text("Ini container 3"),)
      ],
    );
  }
}