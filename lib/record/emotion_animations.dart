import 'package:fapp/record/emotion_utils.dart';
import 'package:flutter/material.dart';

class EmotionAnimations {
  final TickerProvider vsync;
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  late AnimationController opacityController;
  late Animation<double> opacityAnimation;
  late AnimationController backgroundController;
  late Animation<Color?> startColorAnimation;
  late Animation<Color?> endColorAnimation;

  EmotionAnimations(this.vsync) {
    _initAnimations();
  }

  void _initAnimations() {
    scaleController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: vsync,
    );

    scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(weight: 1, tween: Tween<double>(begin: 1.0, end: 1.02)),
      TweenSequenceItem(
        weight: 1,
        tween: Tween<double>(begin: 1.02, end: 1.04),
      ),
      TweenSequenceItem(
        weight: 1,
        tween: Tween<double>(begin: 1.04, end: 1.06),
      ),
      TweenSequenceItem(
        weight: 1,
        tween: Tween<double>(begin: 1.06, end: 1.04),
      ),
      TweenSequenceItem(
        weight: 1,
        tween: Tween<double>(begin: 1.04, end: 1.02),
      ),
      TweenSequenceItem(weight: 1, tween: Tween<double>(begin: 1.02, end: 1.0)),
    ]).animate(scaleController);

    opacityController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: vsync,
    );

    opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(opacityController);

    backgroundController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: vsync,
    );

    // 초기 배경색을 palette[0]의 배경색으로 명확하게 설정
    final initialColors = EmotionUtils.getGradientColors(0);
    startColorAnimation = ColorTween(
      begin: initialColors[0],
      end: initialColors[0],
    ).animate(backgroundController);

    endColorAnimation = ColorTween(
      begin: initialColors[1],
      end: initialColors[1],
    ).animate(backgroundController);

    // 애니메이션을 완료된 상태로 설정하여 초기 색상이 보이도록 함
    backgroundController.value = 1.0;
  }

  void updateBackgroundAnimation(int prevEmotion, int nextEmotion) {
    final prevStartColor = EmotionUtils.getGradientColors(prevEmotion)[0];
    final prevEndColor = EmotionUtils.getGradientColors(prevEmotion)[1];
    final currentStartColor = EmotionUtils.getGradientColors(nextEmotion)[0];
    final currentEndColor = EmotionUtils.getGradientColors(nextEmotion)[1];

    startColorAnimation = ColorTween(
      begin: prevStartColor,
      end: currentStartColor,
    ).animate(backgroundController);

    endColorAnimation = ColorTween(
      begin: prevEndColor,
      end: currentEndColor,
    ).animate(backgroundController);
  }

  void dispose() {
    scaleController.dispose();
    opacityController.dispose();
    backgroundController.dispose();
  }
}
