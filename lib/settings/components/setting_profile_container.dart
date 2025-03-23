import 'package:flutter/material.dart';

class SettingProfileContainer extends StatelessWidget {
  const SettingProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0CFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(''),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('편집', style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              '프로필',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ProfileInfoRow(label: '이름', value: 'ㅁㄴㅇ'),
                  Divider(height: 1),
                  ProfileInfoRow(label: '생년월일', value: '1234. 56. 78, (90))'),
                  Divider(height: 1),
                  ProfileInfoRow(label: '성별', value: '남성'),
                  Divider(height: 1),
                  ProfileInfoRow(label: '혈액형', value: 'RH A+'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
