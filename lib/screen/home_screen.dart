import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:mercur_daily_sunshine/model/daily_task.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:mercur_daily_sunshine/widgets/custom_appbar.dart';
import 'package:mercur_daily_sunshine/widgets/daily_quote_card.dart';
import 'package:mercur_daily_sunshine/widgets/daily_task_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    for (int i = 0; i < 3; i++) {
      _tasks.add(DailyTask.fromJson(data["dailyTasks"][i]));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: "Mercur Daily Sunshine"),
      backgroundColor: Colors.white,
      body: _tasks.isEmpty
          ? const Center(
              child: CupertinoActivityIndicator(
                color: Colors.grey,
              ),
            )
          : SingleChildScrollView(
              child: Consumer<AppProvider>(
                builder: (context, value, child) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        "Daily quote",
                        style: TextStyle(
                          fontSize: 23,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.015),
                      DailyQuoteCard(quote: quote),
                      SizedBox(height: screenSize.height * 0.025),
                      Text(
                        "Daily Tasks:",
                        style: TextStyle(
                          fontSize: 23,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.015),
                      for (int i = 0; i < _tasks.length; i++)
                        Opacity(
                          opacity: value.doneTasks
                                  .any((t) => t.title == _tasks[i].title)
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
