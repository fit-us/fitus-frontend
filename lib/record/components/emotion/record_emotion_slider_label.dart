import 'package:flutter/material.dart';

class RecordEmotionSliderLabel extends StatelessWidget {
  const RecordEmotionSliderLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "아주 불쾌함",
            style: TextStyle(fontSize: 12.0, color: Colors.grey.shade700),
          ),
          Text(
            "아주 기분 좋음",
            style: TextStyle(fontSize: 12.0, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
