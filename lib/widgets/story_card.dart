import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:mercur_daily_sunshine/model/story.dart';
import 'package:mercur_daily_sunshine/screen/story_details_screen.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:provider/provider.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  final bool isBought;

  const StoryCard({
    super.key,
    required this.story,
    required this.isBought,
  });

  void _showStatusDialog(BuildContext context) {
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
                    'assets/images/image3.png',
                  ),
                  radius: 40,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Are you sure to buy this story?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  "100 coins",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        final provider =
                            Provider.of<AppProvider>(context, listen: false);
                        if (provider.totalCoins >= 100) {
                          provider.addBoughtStory(story);
                          provider.decreaseCoins(100);
                        } else {
                          showNotEnoughCoinsPopup(context);
                        }
                      },
                      child: const Text(
                        'Buy story',
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
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
    return Container(
      padding: const EdgeInsets.all(13),
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Story",
            style: TextStyle(
              fontSize: 15,
              color: primaryColor,
            ),
          ),
          Text(
            story.title,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(primaryColor),
              elevation: const WidgetStatePropertyAll(0),
            ),
            onPressed: () {
              if (!isBought) {
                _showStatusDialog(context);
              } else {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => StoryDetailsScreen(story: story),
                  ),
                );
              }
            },
            child: Text(
              isBought ? "Read now" : "Buy for 100 coins",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
