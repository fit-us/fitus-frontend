import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fapp/app_state.dart';
import 'package:fapp/pages/emotion-calendar-page.dart';

class EmotionCalendarButton extends StatelessWidget {
  const EmotionCalendarButton({super.key});

  void _handleShowEmotionCalendar(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.setBottomTabVisibility(false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (modalContext) => Container(
            height: MediaQuery.of(context).size.height * 0.87,
            decoration: const BoxDecoration(
              color: Colors.white,
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
                const SizedBox(height: 16),
                Expanded(child: EmotionCalendarPage()),
              ],
            ),
          ),
    ).then((_) {
      appState.setBottomTabVisibility(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {_handleShowEmotionCalendar(context)},
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
        decoration: BoxDecoration(
          color: const Color(0xffDCDDDD),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_month, size: 16),
            const SizedBox(
              width: 8,
            ), // Added a small space between icon and text
            const Text(
              "감정 캘린더",
              style: TextStyle(
                color: Color(0xff3E3A39),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
