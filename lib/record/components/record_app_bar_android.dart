import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:fapp/app_state.dart';
import 'package:fapp/screens/emotion_home.dart';

class RecordAppBarAndroid extends StatelessWidget
    implements PreferredSizeWidget {
  const RecordAppBarAndroid({super.key});

  @override
  Size get preferredSize =>
      Size.fromHeight(Platform.isIOS ? 44.0 : kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(""),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (ModalRoute.of(context)?.settings.name ==
              '/record-select-moment') {
            Provider.of<AppState>(
              context,
              listen: false,
            ).setBottomTabVisibility(true);
          }
          Navigator.of(context).pop();
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Provider.of<AppState>(
              context,
              listen: false,
            ).setBottomTabVisibility(true);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: const Text("취소"),
        ),
      ],
    );
  }
}
