import 'package:flutter/material.dart';

class EmptyTime extends StatelessWidget {
  final int hour;
  const EmptyTime({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    final formattedHour = '${hour.toString().padLeft(2, '0')}.00';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Text(formattedHour),
        ),
        Expanded(
          child: Container(
            height: 1,
          )
        )
      ],
    );
  }
}
