import 'package:flutter/material.dart';

class RecordEmotionText extends StatelessWidget {
  final String Function(int) getEmotionText;
  final int emotion;

  const RecordEmotionText({
    super.key,
    required this.getEmotionText,
    required this.emotion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        getEmotionText(emotion),
        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}
