import 'package:flutter/material.dart';

class DayEmotionSummary extends StatelessWidget {
  final String dayEmotionImage;
  final List<String> dayEmotions;
  final String dayEmotionSummary;
  final String dayEmotionPlace;
  final String dayEmotionDescription;

  const DayEmotionSummary({
    super.key,
    required this.dayEmotionImage,
    required this.dayEmotions,
    required this.dayEmotionSummary,
    required this.dayEmotionPlace,
    required this.dayEmotionDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '하루의 감정',
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Center(
          child: Image.asset(
            dayEmotionImage,
            width: 266,
            height: 75,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 6),
        Center(
          child: Column(
            children: [
              Text(
                dayEmotions.join(', '),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dayEmotionSummary,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                dayEmotionPlace,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                dayEmotionDescription,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 1,
          color: Colors.grey[200],
          margin: const EdgeInsets.symmetric(vertical: 6),
        ),
      ],
    );
  }
}
