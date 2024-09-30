import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:mercur_daily_sunshine/widgets/custom_appbar.dart';
import 'package:mercur_daily_sunshine/widgets/daily_quote_card.dart';
import 'package:mercur_daily_sunshine/widgets/story_card.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _statusIndex = 0;

  void _showNicknameDialog(BuildContext context) {
    final nicknameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Set Your Nickname',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: nicknameController,
                decoration: InputDecoration(
                  labelText: 'Nickname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle the submission of the nickname
                      String nickname = nicknameController.text;
                      final provider =
                          Provider.of<AppProvider>(context, listen: false);
                      provider.setNickname(nickname);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Cancel and close the dialog
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage("assets/images/avatars/Designer ($index).png"),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(height: 16),
              const Text(
                'Are you sure you want to change your avatar?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      final provider =
                          Provider.of<AppProvider>(context, listen: false);
                      provider.changeAvatarIndex(index);
                      Navigator.pop(context);
                      print('Avatar change confirmed.');
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Cancel and close the dialog
                      Navigator.pop(context);
                      print('Avatar change cancelled.');
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.thumb_down,
                            color: Colors.red, size: 40),
                        onPressed: () {
                          _statusIndex = 0;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.thumb_up,
                            color: Colors.green, size: 40),
                        onPressed: () {
                          _statusIndex = 1;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Title text
                const Text(
                  'Choose your status',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                // Row for Set status and Cancel buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Set status',
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        // Cancel action
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.02),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                        ),
                        width: screenSize.height * 0.17,
                        height: screenSize.height * 0.17,
                        child: Consumer<AppProvider>(
                          builder: (context, value, child) => ClipRRect(
                            borderRadius: BorderRadius.circular(
                                screenSize.height * 0.085),
                            child: Image.asset(
                              "assets/images/avatars/Designer (${value.avatarIndex}).png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            _showStatusDialog(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  _statusIndex == 0 ? Colors.red : Colors.green,
                              shape: BoxShape.circle,
                            ),
                            width: screenSize.height * 0.06,
                            height: screenSize.height * 0.06,
                            child: Icon(
                              _statusIndex == 0
                                  ? Icons.thumb_down
                                  : Icons.thumb_up,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width * 0.05),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<AppProvider>(
                        builder: (context, value, child) => Text(
                          value.nickname.isEmpty
                              ? "Name Surname"
                              : value.nickname,
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showNicknameDialog(context);
                        },
                        child: Text(
                          "Change nickname",
                          style: TextStyle(
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
              SizedBox(height: screenSize.height * 0.02),
              Text(
                "Your own avatars:",
                style: TextStyle(
                  fontSize: 23,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: screenSize.height * 0.015),
              Consumer<AppProvider>(
                builder: (context, value, child) {
                  if (value.boughtAvatarsIndex.isEmpty) {
                    return Container(
                      margin: EdgeInsets.only(top: screenSize.height * 0.01),
                      child: const Center(
                        child: Text(
                          "You don't have any avars yet.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: screenSize.height * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.boughtAvatarsIndex.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _showConfirmationDialog(
                                context, value.boughtAvatarsIndex[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "assets/images/avatars/Designer (${value.boughtAvatarsIndex[index]}).png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text(
                "Your own stories:",
                style: TextStyle(
                  fontSize: 23,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: screenSize.height * 0.015),
              Consumer<AppProvider>(
                builder: (context, value, child) {
                  if (value.boughtStories.isEmpty) {
                    return Container(
                      margin: EdgeInsets.only(top: screenSize.height * 0.01),
                      child: const Center(
                        child: Text(
                          "You don't have any stories yet.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.boughtStories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: StoryCard(
                          story: value.boughtStories[index],
                          isBought: true,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
