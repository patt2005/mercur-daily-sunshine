import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/screen/navigation_screen.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<String> _titles = [
    "Welcome to Mercur Daily Sunshine!",
    "Get Inspired Every Day",
    "Complete Simple Tasks",
    "Customize Profile",
    "Earn Points and Customize",
    "Ready to Shine?"
  ];

  final List<String> _descriptions = [
    "We’re thrilled to have you here! This app will help you find positivity and motivation every day. Let’s start your journey to happiness!",
    "Each day, you’ll receive a new motivational quote to energize your spirit and mindset. Discover wisdom that will help you move forward!",
    "Every morning, we’ll suggest small tasks designed to enhance your mood and well-being. These simple actions can transform your day!",
    "Choose avatars that reflect your mood. Make the app truly yours!",
    "Successfully complete daily tasks to earn points! Use them to unlock fun accessories for your sun character. Let your personality shine!",
    "Let’s embark on this journey together! Tap below to start your first day with Mercur Daily Sunshine!"
  ];

  Widget _buildOnboardingPage(int pageIndex) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          SizedBox(height: screenSize.height * 0.1),
          Image.asset(
            "assets/images/image${pageIndex + 1}.png",
            width: screenSize.width,
            height: screenSize.height * 0.4,
            fit: BoxFit.cover,
          ),
          SizedBox(height: screenSize.height * 0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  _titles[pageIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 23,
                    color: Color(0xFF291C6D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                Text(
                  _descriptions[pageIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                ElevatedButton(
                  onPressed: () async {
                    if (pageIndex == _titles.length - 1) {
                      await Navigator.of(context).pushReplacement(
                        CupertinoPageRoute(
                          builder: (context) => const NavigationScreen(),
                        ),
                      );
                      return;
                    }
                    await _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    ),
                    backgroundColor: WidgetStatePropertyAll(primaryColor),
                    elevation: const WidgetStatePropertyAll(0),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        children: [
          for (int i = 0; i < _titles.length; i++) _buildOnboardingPage(i),
        ],
      ),
    );
  }
}
