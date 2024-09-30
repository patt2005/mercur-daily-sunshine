import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/model/daily_task.dart';
import 'package:mercur_daily_sunshine/screen/task_details_screen.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';

class DailyTaskCard extends StatelessWidget {
  final DailyTask task;
  final bool isCompleted;

  const DailyTaskCard({
    super.key,
    required this.task,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isCompleted) {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => TaskDetailsScreen(task: task),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(
                color: primaryColor,
                fontSize: 13,
              ),
            ),
            Text(
              task.text,
              style: TextStyle(
                color: primaryColor,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            Row(
              children: [
                Text(
                  task.coinsReward.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.all_out,
                  color: Color(0xFF291C6D),
                  size: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
