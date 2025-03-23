import 'dart:developer';

import 'package:fapp/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 시간 형식 변경을 위해 import

class EmotionSummaryDayBox extends StatelessWidget {
  final int emotion;
  final String emotionText;
  final String emotionPlace;
  final String emotionDescription;
  final List<String> expressions;
  final String timeStamp;

  const EmotionSummaryDayBox({
    super.key,
    required this.emotion,
    required this.emotionText,
    required this.emotionPlace,
    required this.emotionDescription,
    required this.expressions,
    required this.timeStamp,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime = timeStamp;
    try {
      final inputFormat = DateFormat('yyyy-MM-dd HH시 mm분');
      final parsedTime = inputFormat.parse(timeStamp);
      final outputFormat = DateFormat('HH시 mm분');
      formattedTime = outputFormat.format(parsedTime);
    } catch (e) {
      log('Error parsing timeStamp: $e');
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              palette[emotion].imagePath ?? 'assets/small/no_emotion.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 4.0,
                        children:
                            expressions
                                .map(
                                  (expression) => Text(
                                    expression,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                    Text(
                      formattedTime,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9FA0A0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  emotionText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9FA0A0),
                  ),
                ),
                Text(
                  emotionPlace,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFC9CACA),
                  ),
                ),
                Text(
                  emotionDescription,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFC9CACA),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
