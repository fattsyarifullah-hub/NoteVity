import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/task_model.dart';
import '../utils/task_color.dart';
import '../providers/task_providers.dart';

class TaskTile extends StatelessWidget {
  final ActivityTask task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat("HH.mm").format(task.endTime);

    final cardColor = task.priority.realColor();

    final bool isDisable = task.isCompleted || task.isExpired;

    return Padding(
      padding: EdgeInsetsGeometry.only(top: 5.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(left: 7.5),
            child: SizedBox(
              width: 50.0,
              height: 25.0,
              child: Text(
                timeFormat,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border(left: BorderSide(color: cardColor, width: 10)),
              ),
              child: Container(
                margin: EdgeInsets.only(right: 15.0),
                padding: EdgeInsets.only(left: 15.0, right: 20.0),
                decoration: BoxDecoration(color: cardColor.withOpacity(0.3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        shadows: [
                          Shadow(
                            color: const Color.fromARGB(
                              255,
                              242,
                              240,
                              240,
                            ).withOpacity(0.3),
                            offset: Offset(1, 3),
                          ),
                        ],
                        decoration: isDisable && task.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    InkWell(
                      onTap: isDisable && !task.isCompleted
                          ? null
                          : () {
                              context.read<TaskProvider>().toggleCompleted(
                                task,
                              );
                            },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: cardColor.withOpacity(0.7),
                            width: 3,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: task.isCompleted
                            ? Icon(Icons.check, size: 20, color: Colors.white)
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
