import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCard({
  required IconData iconcard,
  required String title,
  required int count,
  required Color color,
}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 238, 238),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 103, 99, 99),
            offset: Offset(3, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(left: 7.5),
            child: Row(
              children: [
                Icon(iconcard, color: color),
                SizedBox(width: 5.0),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    color: color,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: const Color.fromARGB(
                          255,
                          173,
                          172,
                          172,
                        ).withOpacity(0.3),
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$count',
            style: GoogleFonts.roboto(
              color: color,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: const Color.fromARGB(
                    255,
                    173,
                    172,
                    172,
                  ).withOpacity(0.3),
                  offset: Offset(1, 3),
                ),
              ],
            ),
          ),
          Text(
            "Task",
            style: GoogleFonts.roboto(
              color: color,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: const Color.fromARGB(
                    255,
                    173,
                    172,
                    172,
                  ).withOpacity(0.3),
                  offset: Offset(1, 3),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
