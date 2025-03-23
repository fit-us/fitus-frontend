import 'package:flutter/material.dart';

class RecordEmotionImage extends StatelessWidget {
  final AnimationController opacityController;
  final Animation<double> opacityAnimation;
  final double Function() getImageScale;
  final String Function(int) getImagePath;
  final double Function(int) getImageWidth;
  final double Function(int) getImageHeight;
  final BoxFit Function(int) getImageFit;
  final int emotion;

  const RecordEmotionImage({
    super.key,
    required this.opacityController,
    required this.opacityAnimation,
    required this.getImageScale,
    required this.getImagePath,
    required this.getImageWidth,
    required this.getImageHeight,
    required this.getImageFit,
    required this.emotion,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: opacityController,
            builder: (context, child) {
              return Opacity(
                opacity: opacityAnimation.value,
                child: Transform.scale(
                  scale: getImageScale(),
                  child: Image.asset(
                    getImagePath(emotion),
                    width: getImageWidth(emotion),
                    height: getImageHeight(emotion),
                    fit: getImageFit(emotion),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
