import 'package:fapp/pages/emotion-calendar-page.dart';
import 'package:flutter/material.dart';

class EmotionCalendarButton extends StatelessWidget {
  const EmotionCalendarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            barrierColor: Colors.transparent,
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder:
                (context, animation, secondaryAnimation) =>
                    EmotionCalendarPage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final offset = Tween<Offset>(
                begin: const Offset(0, 1),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              );
              return SlideTransition(position: offset, child: child);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
        padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
        decoration: BoxDecoration(
          color: Color(0xffDCDDDD),
          borderRadius: BorderRadius.circular(12),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month, size: 16),
            Text(
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
