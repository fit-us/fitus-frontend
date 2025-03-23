import 'dart:developer';

import 'package:fapp/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmotionSummaryItem extends StatelessWidget {
  final Map<String, dynamic> emotionData;

  const EmotionSummaryItem({super.key, required this.emotionData});

  @override
  Widget build(BuildContext context) {
    final emotionIndex = emotionData['emotion'] as int;
    final paletteItem = palette[emotionIndex];
    String formattedTime = emotionData['timeStamp'];
    try {
      final inputFormat = DateFormat('yyyy-MM-dd HH시 mm분');
      final parsedTime = inputFormat.parse(emotionData['timeStamp']);
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
            child: Image.asset(paletteItem.smallImagePath, fit: BoxFit.contain),
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
                            (emotionData['expressions'] as List<dynamic>)
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
                  emotionData['emotionText'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9FA0A0),
                  ),
                ),
                Text(
                  emotionData['emotionPlace'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFC9CACA),
                  ),
                ),
                Text(
                  emotionData['emotionDescription'],
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
