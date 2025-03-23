import 'package:flutter/material.dart';
import 'package:fapp/emotion/emotion_summary_item.dart';

class AllEmotionsModal extends StatefulWidget {
  final List<Map<String, dynamic>> emotions;
  final String date;
  final List<String> dayEmotions;
  final String dayEmotionSummary;
  final String dayEmotionPlace;
  final String dayEmotionDescription;
  final String dayEmotionImage;

  const AllEmotionsModal({
    super.key,
    required this.emotions,
    required this.date,
    required this.dayEmotions,
    required this.dayEmotionSummary,
    required this.dayEmotionPlace,
    required this.dayEmotionDescription,
    required this.dayEmotionImage,
  });

  @override
  State<AllEmotionsModal> createState() => _AllEmotionsModalState();
}

class _AllEmotionsModalState extends State<AllEmotionsModal> {
  List<Map<String, dynamic>> emotions = [];

  @override
  void initState() {
    super.initState();
    emotions = widget.emotions;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(105, 77, 255, 0.25),
            Color.fromRGBO(255, 255, 255, 0.5),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset(
                        widget.dayEmotionImage,
                        width: 266,
                        height: 75,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      widget.dayEmotions.join(', '),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        widget.dayEmotionSummary,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      widget.dayEmotionPlace,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      widget.dayEmotionDescription,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Color(0xFFDCDDDD),
                margin: const EdgeInsets.symmetric(vertical: 24),
              ),
              Column(
                children:
                    emotions.map((emotionData) {
                      return EmotionSummaryItem(emotionData: emotionData);
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
