import 'package:fapp/entities/emotion/models/emotion-types.dart';
import 'package:fapp/entities/emotion/utils/emotion-color-util.dart';
import 'package:fapp/entities/emotion/utils/emotion-image-util.dart';
import 'package:flutter/material.dart';

class EmotionCalendarCell extends StatelessWidget {
  const EmotionCalendarCell({
    super.key,
    required this.day,
    required this.emotion,
  });

  final DateTime day;
  final EmotionTypes? emotion;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${day.day}', style: TextStyle(fontSize: 12)),
              SizedBox(height: 4),

              emotion != null
                  ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: EmotionImageUtil.getEmotionImage(emotion!),
                  )
                  : Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffC9CACA)),
                    ),
                  ),

              SizedBox(height: 8),

              emotion != null
                  ? Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: EmotionColorUtil.getEmotionColor(emotion!),
                    ),
                  )
                  : SizedBox(width: 6, height: 6),
            ],
          ),
        );
      },
    );
  }
}
