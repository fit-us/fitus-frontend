import 'dart:developer';
import 'dart:io';
import 'package:fapp/record/components/record_app_bar_android.dart';
import 'package:fapp/record/components/record_app_bar_ios.dart';
import 'package:fapp/record/components/record_expression_box.dart';
import 'package:fapp/record/record_context.dart';
import 'package:fapp/record/record_select_description.dart';
import 'package:fapp/style/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmotionExpressScreen extends StatefulWidget {
  const EmotionExpressScreen({super.key, required this.emotionIndex});

  final int emotionIndex;

  @override
  State<EmotionExpressScreen> createState() => _EmotionExpressScreenState();
}

class _EmotionExpressScreenState extends State<EmotionExpressScreen> {
  List<String> selectedExpressions = [];
  String get emotionText => _getEmotionText(widget.emotionIndex);

  void setExpressions(List<String> expressions) {
    log("Setting expressions: $expressions");
  }

  void handleNext() {
    setExpressions(selectedExpressions);
    setState(() {
      Provider.of<RecordContext>(
        context,
        listen: false,
      ).setExpressions(selectedExpressions);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RecordSelectDescription()),
    );
  }

  final List<String> expressions = [
    "감탄스러움",
    "신남",
    "놀람",
    "열정적인",
    "행복함",
    "기쁨",
    "대단함",
    "자랑스러움",
    "자신 있음",
    "희망적인",
    "재미있음",
    "안도감",
    "감사함",
    "충족감을 느낌",
    "차분함",
    "평온함",
  ];

  void handleExpressionSelect(String expression) {
    setState(() {
      if (selectedExpressions.contains(expression)) {
        selectedExpressions =
            selectedExpressions.where((expr) => expr != expression).toList();
      } else {
        selectedExpressions = [...selectedExpressions, expression];
      }
    });
  }

  String _getEmotionText(int emotionIndex) {
    const emotionTexts = [
      "아주 불쾌함",
      "불쾌함",
      "약간 불쾌함",
      "보통",
      "약간 기분 좋음",
      "기분 좋음",
      "아주 기분 좋음",
    ];
    if (emotionIndex >= 0 && emotionIndex < emotionTexts.length) {
      return emotionTexts[emotionIndex];
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
          resizeToAvoidBottomInset: true,
          navigationBar: RecordAppBarIos(title: ""),
          child: Material(
            // Wrap with Material on iOS
            child: SafeArea(child: _buildContent(context)),
          ),
        )
        : Scaffold(
          appBar: const RecordAppBarAndroid(),
          body: SafeArea(child: _buildContent(context)),
        );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: palette[widget.emotionIndex].backgroundColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Image.asset(
                      palette[widget.emotionIndex].imagePath,
                      width: palette[widget.emotionIndex].width,
                      height: palette[widget.emotionIndex].height,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  emotionText,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "이 감정을 가장 잘 나타내는 표현은 무엇인가요?",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const Divider(color: Colors.black, thickness: 1.0),
                  ],
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children:
                    expressions.map((expr) {
                      return ExpressionBox(
                        label: expr,
                        onPressed: () => handleExpressionSelect(expr),
                        isSelected: selectedExpressions.contains(expr),
                      );
                    }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("더 보기", style: TextStyle(fontSize: 16.0)),
                    Text("›", style: TextStyle(fontSize: 20.0)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: handleNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: palette[widget.emotionIndex].buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9999),
                      ),
                    ),
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Placeholder extends StatelessWidget {
  const Placeholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Screen")),
      body: const Center(child: Text("This is the form screen.")),
    );
  }
}
