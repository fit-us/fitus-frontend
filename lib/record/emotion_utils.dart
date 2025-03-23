import 'package:fapp/style/palette.dart';
import 'package:flutter/material.dart';

class EmotionUtils {
  static const List<String> emotionTexts = [
    "아주 불쾌함",
    "불쾌함",
    "약간 불쾌함",
    "보통",
    "약간 기분 좋음",
    "기분 좋음",
    "아주 기분 좋음",
  ];

  static String getEmotionText(int emotionIndex) {
    if (emotionIndex >= 0 && emotionIndex < emotionTexts.length) {
      return emotionTexts[emotionIndex];
    }
    return "";
  }

  static List<Color> getGradientColors(int emotionIndex) {
    if (emotionIndex >= 0 && emotionIndex < palette.length) {
      return palette[emotionIndex].backgroundColor;
    }
    return [Colors.grey.shade300, Colors.grey.shade500];
  }

  static Color getButtonColor(int emotionIndex) {
    if (emotionIndex >= 0 && emotionIndex < palette.length) {
      return palette[emotionIndex].buttonColor;
    }
    return Colors.blue;
  }

  static String getImagePath(int emotionIndex) {
    if (emotionIndex >= 0 && emotionIndex < palette.length) {
      return palette[emotionIndex].imagePath;
    }
    return 'assets/0.png';
  }

  static BoxFit getImageFit(int emotionIndex) {
    if (emotionIndex >= 0 && emotionIndex < palette.length) {
      return palette[emotionIndex].objectFit;
    }
    return BoxFit.contain;
  }

  static double getImageWidth(int emotionIndex) {
    if (emotionIndex >= 0 && emotionIndex < palette.length) {
      return palette[emotionIndex].width;
    }
    return 266.0;
  }

  static double getImageHeight(int emotionIndex) {
    if (emotionIndex >= 0 && emotionIndex < palette.length) {
      return palette[emotionIndex].height;
    }
    return 266.0;
  }
}
