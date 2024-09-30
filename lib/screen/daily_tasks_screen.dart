import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:mercur_daily_sunshine/model/daily_task.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:mercur_daily_sunshine/widgets/custom_appbar.dart';
import 'package:mercur_daily_sunshine/widgets/daily_task_card.dart';
import 'package:provider/provider.dart';

class DailyTasksScreen extends StatefulWidget {
  const DailyTasksScreen({super.key});

  @override
  State<DailyTasksScreen> createState() => _DailyTasksScreenState();
}

class _DailyTasksScreenState extends State<DailyTasksScreen> {
  final List<DailyTask> _tasks = [];

  @override
  void initState() {
    super.initState();
    _getDailyTasks();
  }

  void _getDailyTasks() async {
    final jsonData =
        await rootBundle.loadString("assets/data/daily_tasks.json");
    final data = jsonDecode(jsonData);
    for (int i = 0; i < data["dailyTasks"].length; i++) {
      _tasks.add(DailyTask.fromJson(data["dailyTasks"][i]));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCustomAppBar(title: "Tasks"),
      body: Consumer<AppProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.01),
                Text(
                  "Taks:",
                  style: TextStyle(
                    fontSize: 23,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.015),
                for (int i = 0; i < _tasks.length; i++)
                  Opacity(
                    opacity:
                        value.doneTasks.any((t) => t.title == _tasks[i].title)
                            ? 0.4
                            : 1,
                    child: DailyTaskCard(
                      task: _tasks[i],
                      isCompleted: value.doneTasks
                          .any((t) => t.title == _tasks[i].title),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
