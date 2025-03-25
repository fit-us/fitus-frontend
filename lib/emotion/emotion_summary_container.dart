import 'package:fapp/emotion/emotion_day_summary.dart';
import 'package:fapp/emotion/emotion_summary_card.dart';
import 'package:fapp/emotion/emotion_summary_header.dart';
import 'package:fapp/emotion/emotion_moment_section.dart';
import 'package:fapp/record/record_select_moment.dart';
import 'package:flutter/material.dart';

class EmotionSummaryContainer extends StatelessWidget {
  final String date;
  final List<String> dayEmotions;
  final String dayEmotionSummary;
  final String dayEmotionPlace;
  final String dayEmotionDescription;
  final String dayEmotionImage;
  final double? width;

  const EmotionSummaryContainer({
    super.key,
    required this.date,
    required this.dayEmotions,
    required this.dayEmotionSummary,
    required this.dayEmotionPlace,
    required this.dayEmotionDescription,
    required this.dayEmotionImage,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return EmotionSummaryCard(
      child: Column(
        children: [
          EmotionSummaryHeader(
            date: date,
            onRecordPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RecordSelectMoment(),
                  settings: const RouteSettings(name: '/record-select-moment'),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          DayEmotionSummary(
            dayEmotionImage: dayEmotionImage,
            dayEmotions: dayEmotions,
            dayEmotionSummary: dayEmotionSummary,
            dayEmotionPlace: dayEmotionPlace,
            dayEmotionDescription: dayEmotionDescription,
          ),
          const SizedBox(height: 6),
          MomentEmotionSection(
            date: date,
            dayEmotions: dayEmotions,
            dayEmotionSummary: dayEmotionSummary,
            dayEmotionPlace: dayEmotionPlace,
            dayEmotionDescription: dayEmotionDescription,
            dayEmotionImage: dayEmotionImage,
          ),
        ],
      ),
    );
  }
}
