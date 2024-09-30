import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:mercur_daily_sunshine/model/story.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:mercur_daily_sunshine/widgets/custom_appbar.dart';
import 'package:mercur_daily_sunshine/widgets/story_card.dart';
import 'package:provider/provider.dart';

class StoriesShopScreen extends StatefulWidget {
  const StoriesShopScreen({super.key});

  @override
  State<StoriesShopScreen> createState() => _StoriesShopScreenState();
}

class _StoriesShopScreenState extends State<StoriesShopScreen> {
  final List<Story> _stories = [];

  void _getStories() async {
    final jsonData = await rootBundle.loadString("assets/data/stories.json");
    final data = jsonDecode(jsonData);
    for (int i = 0; i < data["stories"].length; i++) {
      _stories.add(Story.fromJson(data["stories"][i]));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCustomAppBar(title: "Stories Shop"),
      body: _stories.isEmpty
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height * 0.02),
                    Text(
                      "Stories shop:",
                      style: TextStyle(
                        fontSize: 23,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.015),
                    Consumer<AppProvider>(
                      builder: (context, value, child) => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _stories.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: StoryCard(
                              story: _stories[index],
                              isBought: value.boughtStories.any(
                                (s) => s.title == _stories[index].title,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
