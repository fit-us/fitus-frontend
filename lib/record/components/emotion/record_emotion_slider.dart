import 'package:flutter/material.dart';

class RecordEmotionSlider extends StatelessWidget {
  final double emotion;
  final ValueChanged<double> onChanged;

  const RecordEmotionSlider({
    super.key,
    required this.emotion,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x0F000000).withAlpha(15),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Slider(
        value: emotion.toDouble(),
        min: 0,
        max: 6,
        divisions: 6,
        thumbColor: Colors.white,
        activeColor: Colors.transparent,
        inactiveColor: Colors.transparent,
        onChanged: onChanged,
      ),
    );
  }
}
