import 'package:flutter/material.dart';
import 'package:fapp/biodashboard/bio_dashboard_item.dart';
import 'package:fapp/biodashboard/bio_score.dart';
import 'package:fapp/mock/emotion_summary.dart';

class BioDashboard extends StatelessWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic>? icons;

  const BioDashboard({super.key, required this.data, this.icons});

  @override
  Widget build(BuildContext context) {
    final bioDataList = <Map<String, dynamic>>[
      {
        'title': '심박수',
        'icon': 'assets/bioIcon/heart.png',
        'iconStyle': const Size(20, 20),
        'color': Colors.purple[500]!,
        'placeholderColor': Colors.pink[100],
        ...MockData.bioMockData['heartRate'],
      },
      {
        'title': '심전도',
        'icon': 'assets/bioIcon/heartlate.png',
        'iconStyle': const Size(20, 20),
        'color': Colors.purple[500]!,
        'placeholderColor': Colors.blue[100],
        ...MockData.bioMockData['ecg'],
      },
      {
        'title': '호흡수',
        'icon': 'assets/bioIcon/lung.png',
        'iconStyle': const Size(18, 18),
        'color': Colors.blue[600]!,
        'placeholderColor': Colors.indigo[100],
        ...MockData.bioMockData['respiratoryRate'],
      },
      {
        'title': '산소포화도',
        'icon': 'assets/bioIcon/person.png',
        'iconStyle': const Size(20, 20),
        'color': Colors.blue[600]!,
        'placeholderColor': Colors.blue[100],
        ...MockData.bioMockData['oxygenSaturation'],
      },
      {
        'title': '최대 산소 섭취량',
        'icon': 'assets/bioIcon/oxygen.png',
        'iconStyle': const Size(20, 20),
        'color': Colors.blue[600]!,
        ...MockData.bioMockData['maxOxygenIntake'],
      },
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                '현재상태분석 차트',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const BioScore(score: 66, maxScore: 100),
              Container(
                height: 1,
                color: Colors.grey[200],
                margin: const EdgeInsets.symmetric(vertical: 16),
              ),
              const Text(
                '실시간 바이오데이터',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ...bioDataList.map(
                (item) => BioDashboardItem(
                  icon: (item['icon'] as String?) ?? '',
                  iconStyle: (item['iconStyle'] as Size?) ?? const Size(20, 20),
                  title: (item['title'] as String?) ?? '',
                  status: (item['status'] as String?) ?? '',
                  value: item['value'],
                  unit: (item['unit'] as String?) ?? '',
                  time: (item['time'] as String?) ?? '',
                  color: item['color'] as Color,
                  placeholder:
                      item.containsKey('placeholderColor')
                          ? Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              color: item['placeholderColor'] as Color?,
                              shape: BoxShape.circle,
                            ),
                          )
                          : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
