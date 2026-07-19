import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyTime extends StatelessWidget {
  final int hour;
  const EmptyTime({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    final formattedHour = '${hour.toString().padLeft(2, '0')}.00';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(left: 7.5, top: 12.5),
          child: SizedBox(
            height: 25.0,
            child: Text(formattedHour, style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
          ),
        ),
        Container(height: 5),
      ],
    );
  }
}
