import 'dart:io';

import 'package:fapp/record/components/record_app_bar_android.dart';
import 'package:fapp/record/components/record_app_bar_ios.dart';
import 'package:fapp/screens/emotion_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:fapp/record/components/record_next_button.dart';
import 'package:fapp/record/record_context.dart';
import 'package:fapp/style/palette.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RecordSelectDescription extends StatefulWidget {
  const RecordSelectDescription({super.key});

  @override
  State<RecordSelectDescription> createState() =>
      _RecordSelectDescriptionState();
}

class _RecordSelectDescriptionState extends State<RecordSelectDescription> {
  String _place = "";
  String _description = "";
  bool _localeInitialized = false;

  late TextEditingController _placeController;
  late TextEditingController _descriptionController;

  static const TextStyle _titleStyle = TextStyle(fontSize: 16.0);
  static const TextStyle _textFieldLabelStyle = TextStyle(
    fontSize: 14.0,
    color: Color(0xFF58515B),
  );
  static const TextStyle _textFieldStyle = TextStyle(
    fontSize: 14.0,
    color: Color(0xFF58515B),
  );
  static const Color _textFieldFillColor = Color(0xFFF0F0F0);

  @override
  void initState() {
    super.initState();
    _placeController = TextEditingController(text: _place);
    _descriptionController = TextEditingController(text: _description);
    _initializeLocale();
  }

  Future<void> _initializeLocale() async {
    await initializeDateFormatting('ko_KR', null);
    setState(() {
      _localeInitialized = true;
    });
  }

  @override
  void dispose() {
    _placeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void changePlace(String place) {
    setState(() {
      _place = place;
    });
  }

  void changeDescription(String desc) {
    setState(() {
      _description = desc;
    });
  }

  Widget _buildContent(BuildContext context) {
    final recordContext = Provider.of<RecordContext>(context);
    final emotionIndex = recordContext.emotion;
    final emotionText = _getEmotionText(emotionIndex);
    final paletteItem = palette[emotionIndex];
    final expressions = recordContext.expressions;

    final now = DateTime.now();

    final formattedTime =
        _localeInitialized
            ? DateFormat('yyyy-MM-dd HH시 mm분', 'ko_KR').format(now)
            : "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour}:${now.minute}";

    Future<List<Map<String, dynamic>>> getExistingEmotions() async {
      final prefs = await SharedPreferences.getInstance();
      final emotionsJson = prefs.getStringList('emotions') ?? [];
      return emotionsJson
          .map((json) => Map<String, dynamic>.from(jsonDecode(json)))
          .toList();
    }

    Future<void> saveEmotion(Map<String, dynamic> newEmotion) async {
      final prefs = await SharedPreferences.getInstance();
      final existingEmotions = await getExistingEmotions();
      final updatedEmotions = [...existingEmotions, newEmotion];
      final emotionsJsonList =
          updatedEmotions.map((emotion) => jsonEncode(emotion)).toList();
      await prefs.setStringList('emotions', emotionsJsonList);
    }

    Future<void> submitEmotion() async {
      final newEmotion = {
        'emotion': emotionIndex,
        'emotionText': emotionText,
        'emotionPlace': _place,
        'emotionDescription': _description,
        'expressions': expressions,
        'timeStamp': formattedTime,
      };
      await saveEmotion(newEmotion);
    }

    void handleNext() {
      submitEmotion();
      recordContext.setEmotion(0);
      recordContext.setMoment("");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }

    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: paletteItem.backgroundColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildEmotionSection(paletteItem, emotionText, expressions),
                  _buildInputSection(context),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: RecordNextButton(
                      text: "기록하기",
                      onPressed: handleNext,
                      buttonColor: paletteItem.buttonColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 감정 표시 섹션
  Widget _buildEmotionSection(
    PaletteItem paletteItem,
    String emotionText,
    List<String> expressions,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        children: [
          SizedBox(
            height: 266,
            width: 266,
            child: Center(
              child: Image.asset(
                paletteItem.imagePath,
                width: paletteItem.width,
                height: paletteItem.height,
                fit: paletteItem.objectFit,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Text(
              emotionText,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            runSpacing: 4.0,
            children:
                expressions
                    .map(
                      (e) => Text(
                        e,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  // 입력 섹션
  Widget _buildInputSection(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("이 감정에 영향을 미친 요인은 무엇인가요?", style: _titleStyle),
              const Divider(color: Colors.black, thickness: 1.0),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("어떤 장소에서 이 감정을 느꼈나요?", style: _textFieldLabelStyle),
              const SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  hintText: "장소를 입력해보세요",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: _textFieldFillColor,
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                style: _textFieldStyle,
                onChanged: changePlace,
                controller: _placeController,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("상황은 어땠나요?", style: _textFieldLabelStyle),
              const SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  hintText:
                      "상황을 입력하면 OO(팀 이름)이 키워드를 분석하여 기분에 영향을 미친 요인을 구체적으로 보여줄거에요!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: _textFieldFillColor,
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                style: _textFieldStyle,
                maxLines: 5,
                textAlignVertical: TextAlignVertical.top,
                onChanged: changeDescription,
                controller: _descriptionController,
              ),
            ],
          ),
        ),
      ],
    );
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
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: const RecordAppBarIos(title: ""),
        child: SafeArea(child: _buildContent(context)),
      );
    } else {
      return Scaffold(
        appBar: const RecordAppBarAndroid(),
        body: SafeArea(child: _buildContent(context)),
      );
    }
  }
}
