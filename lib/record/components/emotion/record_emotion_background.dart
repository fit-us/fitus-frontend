import 'package:flutter/material.dart';

class RecordEmotionBackground extends StatelessWidget {
  final AnimationController backgroundAnimationController;
  final Animation<Color?> startColorAnimation;
  final Animation<Color?> endColorAnimation;
  final int emotionIndex;
  final List<Color> Function(int) getGradientColors;

  const RecordEmotionBackground({
    super.key,
    required this.backgroundAnimationController,
    required this.startColorAnimation,
    required this.endColorAnimation,
    required this.emotionIndex,
    required this.getGradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: backgroundAnimationController,
      builder: (context, child) {
        return Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  startColorAnimation.value ??
                      getGradientColors(emotionIndex)[0],
                  endColorAnimation.value ?? getGradientColors(emotionIndex)[1],
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        );
      },
    );
  }
}
