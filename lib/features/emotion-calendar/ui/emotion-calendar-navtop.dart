import 'package:flutter/material.dart';

class EmotionCalendarNavTop extends StatelessWidget {
  const EmotionCalendarNavTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40),
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
              child: const SizedBox(
                width: 40,
                child: Text(
                  '완료',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Color(0xff8749EB),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
