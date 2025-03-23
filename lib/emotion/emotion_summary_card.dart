import 'package:flutter/material.dart';

class EmotionSummaryCard extends StatelessWidget {
  final Widget child;

  const EmotionSummaryCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: size.width - 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              colors: [Color(0X80694DFF), Color(0XFFFFFFFF)],
              stops: [0, 0.85],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.13),
                offset: Offset(5, 6),
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(padding: const EdgeInsets.all(16.0), child: child),
        ),
      ),
    );
  }
}
