import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:mercur_daily_sunshine/screen/splash_screen.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    quote = await getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        primaryColor: const Color(0xFF291C6D),
      ),
      home: const SplashScreen(),
    );
  }
}
