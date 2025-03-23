import 'package:flutter/material.dart';

class RecordEmotionHeader extends StatelessWidget {
  final String momentText;

  const RecordEmotionHeader({super.key, required this.momentText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          momentText,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
