import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/screen/navigation_screen.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    quote = await getRandomQuote();
    await Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (context) => const NavigationScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CupertinoActivityIndicator(
          color: Colors.grey,
        ),
      ),
    );
  }
}
