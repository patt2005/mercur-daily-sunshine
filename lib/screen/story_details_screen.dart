import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/model/story.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:mercur_daily_sunshine/widgets/custom_appbar.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: const AssetImage('assets/images/image6.png'),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(height: 16),
          const Text(
            'Please, rate this story using stars below:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRating = index + 1; // Update the selected rating
                  });
                },
                child: Icon(
                  index < _selectedRating
                      ? Icons.star
                      : Icons
                          .star_border, // Filled or outlined star based on selection
                  size: 30,
                  color: index < _selectedRating
                      ? Colors.amber
                      : Colors.grey, // Change color based on selection
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              // Handle rating submission, e.g., send the rating to a server or show a confirmation
              Navigator.pop(context);
            },
            child: const Text(
              'Rate',
              style: TextStyle(fontSize: 16, color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}

class StoryDetailsScreen extends StatelessWidget {
  final Story story;

  const StoryDetailsScreen({
    super.key,
    required this.story,
  });

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        child: const RatingDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: story.title),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.015),
              Text(
                "Read story:",
                style: TextStyle(
                  fontSize: 23,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: screenSize.height * 0.015),
              Container(
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
                    Text(
                      story.text,
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.015),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor),
                  elevation: const WidgetStatePropertyAll(0),
                ),
                onPressed: () {
                  _showDialog(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
