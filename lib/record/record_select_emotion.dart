import 'dart:io';
import 'package:fapp/record/components/emotion/record_emotion_background.dart';
import 'package:fapp/record/components/emotion/record_emotion_header.dart';
import 'package:fapp/record/components/emotion/record_emotion_image.dart';
import 'package:fapp/record/components/emotion/record_emotion_slider.dart';
import 'package:fapp/record/components/emotion/record_emotion_slider_label.dart';
import 'package:fapp/record/components/emotion/record_emotion_text.dart';
import 'package:fapp/record/components/record_app_bar_android.dart';
import 'package:fapp/record/components/record_app_bar_ios.dart';
import 'package:fapp/record/components/record_next_button.dart';
import 'package:fapp/record/emotion_animations.dart';
import 'package:fapp/record/emotion_utils.dart';
import 'package:fapp/record/record_context.dart';
import 'package:fapp/record/record_select_expressions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectEmotionScreen extends StatefulWidget {
  const SelectEmotionScreen({super.key});

  @override
  SelectEmotionScreenState createState() => SelectEmotionScreenState();
}

class SelectEmotionScreenState extends State<SelectEmotionScreen>
    with TickerProviderStateMixin {
  int _emotion = 0;
  int _prevEmotion = 0;
  late EmotionAnimations _animations;

  @override
  void initState() {
    super.initState();
    _animations = EmotionAnimations(this);
    _animations.backgroundController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animations.dispose();
    super.dispose();
  }

  void _handleNext() {
    Provider.of<RecordContext>(context, listen: false).setEmotion(_emotion);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmotionExpressScreen(emotionIndex: _emotion),
      ),
    );
  }

  void _handleValueChange(double newValue) {
    setState(() {
      int newEmotion = newValue.round();

      if (newEmotion != _emotion) {
        _prevEmotion = _emotion;
        _emotion = newEmotion;

        _animations.updateBackgroundAnimation(_prevEmotion, _emotion);
        _animations.backgroundController.reset();
        _animations.backgroundController.forward();

        _animations.opacityController.forward().then((_) {
          setState(() {});
          _animations.opacityController.reverse();
        });

        _animations.scaleController.reset();
        _animations.scaleController.animateTo(
          _emotion / 6.0,
          duration: const Duration(milliseconds: 50),
        );
      } else {
        _emotion = newEmotion;
      }
    });
  }

  String _getMomentText() {
    final recordContext = Provider.of<RecordContext>(context);
    final selectedMoment = recordContext.selectedMoment!;
    if (selectedMoment == "지난 순간에 느꼈던 감정") {
      return "지난 순간에 느꼈던\n감정을 선택해보세요";
    }
    return "하루 동안의 전반적인\n기분을 선택해보세요";
  }

  Widget _buildContent(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.black,
          decoration: TextDecoration.none,
        ),
        child: Stack(
          children: [
            RecordEmotionBackground(
              backgroundAnimationController: _animations.backgroundController,
              startColorAnimation: _animations.startColorAnimation,
              endColorAnimation: _animations.endColorAnimation,
              emotionIndex: _emotion,
              getGradientColors: EmotionUtils.getGradientColors,
            ),
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 80.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RecordEmotionHeader(momentText: _getMomentText()),
                        Expanded(
                          child: RecordEmotionImage(
                            opacityController: _animations.opacityController,
                            opacityAnimation: _animations.opacityAnimation,
                            getImageScale: () => 1.0, // 단순화
                            getImagePath: EmotionUtils.getImagePath,
                            getImageWidth: EmotionUtils.getImageWidth,
                            getImageHeight: EmotionUtils.getImageHeight,
                            getImageFit: EmotionUtils.getImageFit,
                            emotion: _emotion,
                          ),
                        ),
                        RecordEmotionText(
                          getEmotionText: EmotionUtils.getEmotionText,
                          emotion: _emotion,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Platform.isIOS ? 8.0 : 16.0,
                    ),
                    child: Column(
                      children: [
                        RecordEmotionSlider(
                          emotion: _emotion.toDouble(),
                          onChanged: _handleValueChange,
                        ),
                        const RecordEmotionSliderLabel(),
                      ],
                    ),
                  ),
                ),
                RecordNextButton(
                  onPressed: _handleNext,
                  buttonColor: EmotionUtils.getButtonColor(_emotion),
                  text: "다음",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
          resizeToAvoidBottomInset: true,
          navigationBar: const RecordAppBarIos(title: "감정기록"),
          child: SafeArea(child: _buildContent(context)),
        )
        : Scaffold(
          appBar: const RecordAppBarAndroid(),
          body: SafeArea(child: _buildContent(context)),
        );
  }
}
