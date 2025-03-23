import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:fapp/screens/emotion_home.dart';

class RecordAppBarIos extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const RecordAppBarIos({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize =>
      Size.fromHeight(Platform.isIOS ? 44.0 : kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true; // Typically, navigation bars fully obstruct the view behind them
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.white.withAlpha(0),
      border: null,
      enableBackgroundFilterBlur: false,
      middle: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: CupertinoColors.systemBlue,
        ),
      ),
      leading: CupertinoNavigationBarBackButton(
        // Changed from CupertinoButton
        onPressed: () => Navigator.of(context).pop(),
        color:
            CupertinoColors
                .systemBlue, // Added color to match the original button
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Text(
          "취소",
          style: TextStyle(fontSize: 16.0, color: CupertinoColors.systemBlue),
        ),
        onPressed: () {
          Navigator.of(
            context,
          ).push(CupertinoPageRoute(builder: (context) => const HomeScreen()));
        },
      ),
    );
  }
}
