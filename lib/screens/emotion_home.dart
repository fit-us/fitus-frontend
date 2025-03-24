import 'package:fapp/emotion/emotion_summary_container.dart';
import 'package:fapp/features/emotion-calendar/ui/emotion-calendar-button.dart';
import 'package:fapp/mock/emotion_summary.dart';
import 'package:fapp/pages/emotion-calendar-page.dart';
import 'package:fapp/widgets/link-button.dart';
import 'package:flutter/material.dart';
import 'package:fapp/biodashboard/biodashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? currentIndex;
  late ScrollController _scrollController;
  late PageController _pageController;
  final emotionData = MockData.emotionData;
  final bioMockData = MockData.bioMockData;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final windowWidth = MediaQuery.of(context).size.width;
    final insets = MediaQuery.of(context).padding;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bgImage.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(bottom: insets.bottom),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      SizedBox(
                        width: double.infinity,
                        height: 530,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: emotionData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                // horizontal: 12.0,
                                vertical: 8.0,
                              ),
                              child: EmotionSummaryContainer(
                                date: emotionData[index]['date'],
                                dayEmotions: emotionData[index]['dayEmotions'],
                                dayEmotionSummary:
                                    emotionData[index]['dayEmotionSummary'],
                                dayEmotionPlace:
                                    emotionData[index]['dayEmotionPlace'],
                                dayEmotionDescription:
                                    emotionData[index]['dayEmotionDescription'],
                                dayEmotionImage:
                                    emotionData[index]['dayEmotionImage'],
                              ),
                            );
                          },
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                EmotionCalendarButton(),
                BioDashboard(data: bioMockData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
