import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:mercur_daily_sunshine/model/daily_task.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:mercur_daily_sunshine/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class TaskDetailsScreen extends StatelessWidget {
  final DailyTask task;

  const TaskDetailsScreen({
    super.key,
    required this.task,
  });

  void _showRewardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/image2.png',
                  ),
                  radius: 40,
                ),
                const SizedBox(height: 16),
                const Text(
                  'You have completed the task\nand earned:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "${task.coinsReward} coins",
                  style: const TextStyle(
                      fontSize: 28,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        final appProvider =
                            Provider.of<AppProvider>(context, listen: false);
                        appProvider.addCoins(task.coinsReward);
                        appProvider.addDoneTask(task);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Claim',
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCustomAppBar(title: "Task details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height * 0.015),
            Text(
              "Task details:",
              style: TextStyle(
                fontSize: 23,
                color: primaryColor,
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            Container(
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
                  Text(
                    "Reward:",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 13,
                    ),
                  ),
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
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 35),
                      ),
                      backgroundColor: WidgetStatePropertyAll(primaryColor),
                      elevation: const WidgetStatePropertyAll(0),
                    ),
                    onPressed: () {
                      _showRewardDialog(context);
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
