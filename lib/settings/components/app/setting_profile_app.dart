import 'package:flutter/material.dart';
import '../setting_profile_common.dart';

Widget buildAppSettingsCard() {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: EdgeInsets.zero,
    child: Column(
      children: [
        buildSettingItem('개인정보이용약관', onTap: () {}),
        const Divider(height: 1, indent: 16, endIndent: 16),
        buildSettingItem('회원탈퇴', onTap: () {}, textColor: Colors.red),
      ],
    ),
  );
}
