import 'package:fapp/entities/emotion/models/emotion-types.dart';
import 'package:flutter/material.dart';

class EmotionImageUtil {
  static Image getEmotionImage(EmotionTypes emotion) {
    switch (emotion) {
      case EmotionTypes.veryUnpleasant:
        return Image.asset("assets/small/small_veryUnpleasant.png");
      case EmotionTypes.unpleasant:
        return Image.asset("assets/small/small_unpleasant.png");
      case EmotionTypes.littleUnpleasant:
        return Image.asset("assets/small/small_littleUnpleasant.png");
      case EmotionTypes.normal:
        return Image.asset("assets/small/small_normal.png");
      case EmotionTypes.littlePleasant:
        return Image.asset("assets/small/small_littlePleasant.png");
      case EmotionTypes.pleasant:
        return Image.asset("assets/small/small_pleasant.png");
      case EmotionTypes.veryPleasant:
        return Image.asset("assets/small/small_veryPleasant.png");
    }
  }
}
