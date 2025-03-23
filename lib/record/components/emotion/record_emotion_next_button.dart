import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class RecordEmotionNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final int emotion;
  final Color Function(int) getButtonColor;
  final AnimationController animationController;

  const RecordEmotionNextButton({
    super.key,
    required this.onPressed,
    required this.emotion,
    required this.getButtonColor,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0, left: 16.0, right: 16.0),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Platform.isIOS
              ? CupertinoButton(
                borderRadius: BorderRadius.circular(9999),
                color: getButtonColor(emotion),
                onPressed: onPressed,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "다음",
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              : Material(
                borderRadius: BorderRadius.circular(9999),
                color: getButtonColor(emotion),
                child: InkWell(
                  onTap: onPressed,
                  borderRadius: BorderRadius.circular(9999),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "다음",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
        },
      ),
    );
  }
}
