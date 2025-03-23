import 'dart:async';
import 'package:fapp/biodashboard/semi_circle_painter.dart';
import 'package:flutter/material.dart';

class BioScore extends StatefulWidget {
  final int score;
  final int maxScore;

  const BioScore({super.key, this.score = 0, this.maxScore = 100});

  @override
  State<BioScore> createState() => _BioScoreState();
}

class _BioScoreState extends State<BioScore> {
  int animatedScore = 0;
  double animatedFill = 0.0;
  Timer? _timer;
  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void didUpdateWidget(BioScore oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.score != widget.score ||
        oldWidget.maxScore != widget.maxScore) {
      _resetAndStartAnimation();
    }
  }

  void _resetAndStartAnimation() {
    setState(() {
      animatedScore = 0;
      animatedFill = 0.0;
    });
    _startAnimation();
  }

  void _startAnimation() {
    _timer?.cancel();
    _animationTimer?.cancel();

    _timer = Timer(const Duration(milliseconds: 300), () {
      _animationTimer = Timer.periodic(const Duration(milliseconds: 10), (
        timer,
      ) {
        setState(() {
          if (animatedScore >= widget.score) {
            timer.cancel();
            animatedScore = widget.score;
          } else {
            animatedScore += 1;
          }

          final target = widget.score / widget.maxScore;
          final step = target / widget.score;

          if (animatedFill >= target) {
            animatedFill = target;
          } else {
            animatedFill += step;
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = 300.0;
    final strokeWidth = 30.0;
    // ignore: unused_local_variable
    final radius = (size - strokeWidth) / 2;

    return Column(
      children: [
        const Text(
          '건강점수',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF6B7280),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                // 크기를 줄임
                size: Size(size / 2, size / 2),
                painter: SemiCirclePainter(
                  backgroundColor: const Color(0xFFE5E7EB),
                  gradient: LinearGradient(
                    colors: [const Color(0XFF8749EB), const Color(0XFFFF49FF)],
                    stops: const [0, 0.85],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  strokeWidth: strokeWidth,
                  fillPercentage: animatedFill,
                ),
              ),
              Positioned(
                // 텍스트 위치 조정
                top: (size / 4) - 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '어제보다\n행복해보여요!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ), // 폰트 크기 줄임
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$animatedScore점',
                      style: const TextStyle(
                        fontSize: 32, // 폰트 크기 줄임
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
