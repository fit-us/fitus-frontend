import 'dart:convert';
import 'dart:developer';

import 'package:fapp/emotion/emotion_no_summary_item.dart';
import 'package:fapp/emotion/emotion_summary_day_box.dart';
import 'package:fapp/emotion/emtion_all_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MomentEmotionSection extends StatefulWidget {
  final String date;
  final List<String> dayEmotions;
  final String dayEmotionSummary;
  final String dayEmotionPlace;
  final String dayEmotionDescription;
  final String dayEmotionImage;

  const MomentEmotionSection({
    super.key,
    required this.date,
    required this.dayEmotions,
    required this.dayEmotionSummary,
    required this.dayEmotionPlace,
    required this.dayEmotionDescription,
    required this.dayEmotionImage,
  });

  @override
  State<MomentEmotionSection> createState() => _MomentEmotionSectionState();
}

class _MomentEmotionSectionState extends State<MomentEmotionSection> {
  List<Map<String, dynamic>>? emotions;

  @override
  void initState() {
    super.initState();
    log('MomentEmotionSection initState - widget.date: ${widget.date}');
    _loadEmotionsForDate();
  }

  Future<void> _loadEmotionsForDate() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final emotionsJson = prefs.getStringList('emotions') ?? [];
      final filteredEmotions =
          emotionsJson
              .map((json) => Map<String, dynamic>.from(jsonDecode(json)))
              .toList();

      setState(() {
        emotions = filteredEmotions;
      });
    } catch (error) {
      log('해당 날짜의 감정 데이터를 불러오는 중 오류가 발생했습니다: $error');
    }
  }

  void _handleShowAllEmotions(BuildContext context) {
    if (emotions != null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder:
            (context) => Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: Color(0xFFC9C4F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 40),
                        Text(
                          widget.date,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Text(
                            '완료',
                            style: TextStyle(
                              color: Color(0xFF694DFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      // borderRadius: const BorderRadius.only(
                      //   topLeft: Radius.circular(20),
                      //   topRight: Radius.circular(20),
                      // ),
                      child: AllEmotionsModal(
                        emotions: emotions!,
                        date: widget.date,
                        dayEmotions: widget.dayEmotions,
                        dayEmotionSummary: widget.dayEmotionSummary,
                        dayEmotionPlace: widget.dayEmotionPlace,
                        dayEmotionDescription: widget.dayEmotionDescription,
                        dayEmotionImage: widget.dayEmotionImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    log('LocalEmotions -> $emotions');
    return Column(
      children: [
        const Text(
          '순간의 감정',
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        (emotions != null && emotions!.isNotEmpty)
            ? EmotionSummaryDayBox(
              emotion: emotions!.last['emotion'],
              emotionText: emotions!.last['emotionText'],
              emotionPlace: emotions!.last['emotionPlace'],
              emotionDescription: emotions!.last['emotionDescription'],
              expressions: List<String>.from(emotions!.last['expressions']),
              timeStamp: emotions!.last['timeStamp'],
            )
            : const NoEmotionSummaryDayBox(),
        if (emotions != null && emotions!.isNotEmpty)
          GestureDetector(
            // Positioned 대신 GestureDetector로 감싸고
            onTap: () => _handleShowAllEmotions(context),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
                color: Colors.grey,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '더 보기',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
