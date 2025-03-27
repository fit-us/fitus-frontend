import 'package:flutter/material.dart';
import '../setting_profile_common.dart';

Widget buildHealthSettingsCard({
  required bool abnormalDetectionEnabled,
  required Function(bool) onToggleAbnormalDetection,
}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: EdgeInsets.zero,
    child: Column(
      children: [
        buildSettingItem('감정기록 추가 설정', onTap: () {}),
        const Divider(height: 1, indent: 16, endIndent: 16),
        buildSettingItem('바이오데이터 내보내기', onTap: () {}),
        const Divider(height: 1, indent: 16, endIndent: 16),
        buildSettingItem('복용중인 약 정보', onTap: () {}),
        const Divider(height: 1, indent: 16, endIndent: 16),
        buildToggleSettingItem(
          '이상징후 탐지 알림',
          abnormalDetectionEnabled,
          onToggleAbnormalDetection,
        ),
        const Divider(height: 1, indent: 16, endIndent: 16),
        buildSettingItem('정신질환 자가문진', onTap: () {}),
      ],
    ),
  );
}
