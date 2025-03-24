import 'package:flutter/material.dart';

class EmotionCalendarNavTop extends StatelessWidget {
  const EmotionCalendarNavTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: 40),
        const Text(
          "감정 캘린더",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff3E3A39),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: SizedBox(
            width: 40,
            child: const Text(
              '완료',
              style: TextStyle(
                color: Color(0xff8749EB),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
