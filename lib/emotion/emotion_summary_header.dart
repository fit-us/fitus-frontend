import 'package:flutter/material.dart';

class EmotionSummaryHeader extends StatelessWidget {
  final String date;
  final VoidCallback onRecordPressed;

  const EmotionSummaryHeader({
    super.key,
    required this.date,
    required this.onRecordPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          date,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: onRecordPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            '기록',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
