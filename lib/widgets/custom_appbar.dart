import 'package:flutter/material.dart';
import 'package:mercur_daily_sunshine/model/app_provider.dart';
import 'package:mercur_daily_sunshine/utils/utils.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget buildCustomAppBar({required String title}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    centerTitle: false,
    title: Text(
      title,
      style: TextStyle(
        color: primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    actions: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Consumer<AppProvider>(
              builder: (context, value, child) => Text(
                value.totalCoins.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.all_out,
              color: Color(0xFF291C6D),
              size: 25,
            ),
          ],
        ),
      ),
      const SizedBox(width: 15),
    ],
  );
}
