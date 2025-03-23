class MockData {
  static final Map<String, dynamic> emotionSummaryMockData = {
    'date': '2024년 3월 15일',
    'dayEmotions': ['기쁨', '만족', '즐거움'],
    'dayEmotionSummary': '아주 행복한 하루',
    'dayEmotionPlace': '친구 집',
    'dayEmotionDescription': '오랜만에 친구들과 즐거운 시간을 보냈다.',
    'dayEmotionImage': 'assets/0.png', // 실제 이미지 경로로 변경
  };

  static final List<String> dayEmotionsMockData = ['기쁨', '만족', '즐거움'];
  static const String dayEmotionSummaryMockData = '아주 행복한 하루';
  static const String dayEmotionPlaceMockData = '친구 집';
  static const String dayEmotionDescriptionMockData = '오랜만에 친구들과 즐거운 시간을 보냈다.';
  static const String dayEmotionImageMockData = 'assets/0.png';
  static final Map<String, dynamic> bioMockData = {
    'happinessScore': 85,
    'heartRate': {
      'value': 67,
      'unit': 'BPM',
      'time': '오후 5:10',
      'status': '최근',
    },
    'ecg': {'value': 72, 'unit': 'mm/mV', 'time': '오후 5:10', 'status': '최근'},
    'respiratoryRate': {
      'value': 16,
      'unit': '회/분',
      'time': '오후 5:10',
      'status': '최근',
    },
    'oxygenSaturation': {
      'value': 94,
      'unit': '%',
      'time': '오후 5:10',
      'status': '평균',
    },
    'maxOxygenIntake': {
      'value': 49,
      'unit': 'ml/분',
      'time': '오후 5:10',
      'status': '최근',
    },
  };
  static final List<Map<String, dynamic>> emotionData = [
    {
      'emotion': 'angry',
      'date': '3월 31일',
      'dayEmotions': ['외로움', '지침', '거슬림'],
      'dayEmotionSummary': '약간 불쾌함',
      'dayEmotionPlace': 'GS25 대구대현점',
      'dayEmotionDescription': '진상손님이 짜증나게 함',
      'dayEmotionImage': 'assets/2.png',
      'expressions': ['짜증', '불쾌'],
      'timeStamp': '오후 8:00',
    },
    {
      'emotion': 'happy',
      'date': '3월 30일',
      'dayEmotions': ['기쁨', '설렘', '만족'],
      'dayEmotionSummary': '아주 행복함',
      'dayEmotionPlace': '카페',
      'dayEmotionDescription': '친구와 즐거운 시간을 보냄',
      'dayEmotionImage': 'assets/0.png',
      'expressions': ['기쁨', '즐거움'],
      'timeStamp': '오후 3:00',
    },
    {
      'emotion': 'fearful',
      'date': '3월 29일',
      'dayEmotions': ['불안', '걱정', '초조'],
      'dayEmotionSummary': '다소 불안함',
      'dayEmotionPlace': '집',
      'dayEmotionDescription': '내일 발표 준비로 긴장됨',
      'dayEmotionImage': 'assets/6.png',
      'expressions': ['불안', '긴장'],
      'timeStamp': '오후 10:00',
    },
  ];
}
