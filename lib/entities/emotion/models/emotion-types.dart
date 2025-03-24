enum EmotionTypes {
  veryPleasant("VERY_PLEASANT"),
  pleasant("PLEASANT"),
  littlePleasant("LITTLE_PLEASANT"),
  normal("NORMAL"),
  littleUnpleasant("LITTLE_UNPLEASANT"),
  unpleasant("UNPLEASANT"),
  veryUnpleasant("VERY_UNPLEASANT");

  final String value;
  const EmotionTypes(this.value);
}
