import 'dart:ui';

import 'package:fapp/entities/emotion/models/emotion-types.dart';

class EmotionColorUtil {
  static Color getEmotionColor(EmotionTypes emotion) {
    switch (emotion) {
      case EmotionTypes.veryUnpleasant:
        return Color(0xff0000FF);
      case EmotionTypes.unpleasant:
        return Color(0xff694DFF);
      case EmotionTypes.littleUnpleasant:
        return Color(0xff8749EB);
      case EmotionTypes.normal:
        return Color(0xffB449EB);
      case EmotionTypes.littlePleasant:
        return Color(0xffE149EB);
      case EmotionTypes.pleasant:
        return Color(0xffFF49FF);
      case EmotionTypes.veryPleasant:
        return Color(0xffFF49FF);
    }
  }
}
