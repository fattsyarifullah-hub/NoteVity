import 'package:flutter/material.dart';

Widget buildCard({
  required String title,
  required int count,
  required Color color,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: color, width: 5)
    ),
    child: Column(
      children: [
        Text(title),
        Text('$count')
      ],
    ),
  );
}
