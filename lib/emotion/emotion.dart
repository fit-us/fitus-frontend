class Emotion {
  final int emotion;
  final String date;
  final List<String> dayEmotions;
  final String dayEmotionSummary;
  final String dayEmotionPlace;
  final String dayEmotionDescription;
  final String dayEmotionImage;
  final List<String> expressions;
  final String timeStamp;

  Emotion({
    required this.emotion,
    required this.date,
    required this.dayEmotions,
    required this.dayEmotionSummary,
    required this.dayEmotionPlace,
    required this.dayEmotionDescription,
    required this.dayEmotionImage,
    required this.expressions,
    required this.timeStamp,
  });
}
