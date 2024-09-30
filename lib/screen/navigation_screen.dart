import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/screen/avatars_shop_screen.dart';
import 'package:mercur_daily_sunshine/screen/daily_tasks_screen.dart';
import 'package:mercur_daily_sunshine/screen/home_screen.dart';
import 'package:mercur_daily_sunshine/screen/profile_screen.dart';
import 'package:mercur_daily_sunshine/screen/stories_shop_screen.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const DailyTasksScreen(),
    const StoriesShopScreen(),
    const AvatarsShopScreen(),
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _pageIndex,
        selectedItemColor: primaryColor,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        unselectedItemColor: Colors.grey.withOpacity(1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bookmark,
            ),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.book,
            ),
            label: "Stories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.moon,
            ),
            label: "Avatars",
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: _screens[_pageIndex],
    );
  }
}
