import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:mercur_daily_sunshine/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class AvatarsShopScreen extends StatefulWidget {
  const AvatarsShopScreen({super.key});

  @override
  State<AvatarsShopScreen> createState() => _AvatarsShopScreenState();
}

class _AvatarsShopScreenState extends State<AvatarsShopScreen> {
  void _showStatusDialog(BuildContext context, int index) {
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
                    'assets/images/image4.png',
                  ),
                  radius: 40,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Are you sure to buy this avatar?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  "25 coins",
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
                        if (provider.totalCoins >= 25) {
                          provider.addBoughtAvatarIndex(index);
                          provider.decreaseCoins(25);
                        } else {
                          showNotEnoughCoinsPopup(context);
                        }
                      },
                      child: const Text(
                        'Buy avatar',
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCustomAppBar(title: "Avatars shop"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.01),
              Text(
                "Avatars shop:",
                style: TextStyle(
                  fontSize: 23,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: screenSize.height * 0.015),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 14,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Consumer<AppProvider>(
                    builder: (context, value, child) => GestureDetector(
                      onTap: () {
                        if (!value.boughtAvatarsIndex.contains(index)) {
                          _showStatusDialog(context, index);
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: value.boughtAvatarsIndex.contains(index)
                              ? 0.3
                              : 1,
                          child: Image.asset(
                            "assets/images/avatars/Designer ($index).png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
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
