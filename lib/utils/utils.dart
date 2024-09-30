import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:provider/provider.dart';

late Size screenSize;

String quote = "";

Color primaryColor = const Color(0xFF291C6D);

Future<String> getRandomQuote() async {
  final jsonData = await rootBundle.loadString("assets/data/quotes.json");
  final data = jsonDecode(jsonData);
  final randomIndex = Random().nextInt(data["quotes"].length);
  return data["quotes"][randomIndex];
}

void showNotEnoughCoinsPopup(BuildContext context) {
  final provider = Provider.of<AppProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.all(16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/avatars/Designer (0).png',
              ),
              radius: 40,
            ),
            const SizedBox(height: 16),
            const Text(
              'You have not enough coins to buy this item, your current balance:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              provider.totalCoins
                  .toString(), // Replace the coin icon with any widget or image you have
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Okay',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
