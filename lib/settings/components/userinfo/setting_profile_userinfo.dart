import 'package:flutter/material.dart';

class SettingProfileUserInfo extends StatelessWidget {
  const SettingProfileUserInfo({
    super.key,
    required this.isEditMode,
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.bloodType,
    required this.nameController,
    required this.onClearField,
    required this.onStartEditing,
    required this.onNameChanged,
    this.birthDateKey,
  });

  final bool isEditMode;
  final String name;
  final String birthDate;
  final String gender;
  final String bloodType;
  final TextEditingController nameController;
  final Function(String) onClearField;
  final Function(String) onStartEditing;
  final Function(String) onNameChanged;
  final GlobalKey? birthDateKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0, bottom: 15.0),
          child: Text(
            '프로필',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: isEditMode ? _buildEditableProfileCard() : _buildProfileCard(),
        ),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Card(
      key: const ValueKey<String>('normal_profile'),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileRow('이름', name),
            const Divider(height: 24),
            _buildProfileRow('생년월일', birthDate),
            const Divider(height: 24),
            _buildProfileRow('성별', gender),
            const Divider(height: 24),
            _buildProfileRow('혈액형', bloodType),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableProfileCard() {
    return Card(
      key: const ValueKey<String>('editable_profile'),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildEditableNameRow(),
            const Divider(height: 24),
            _buildEditableBirthDateRow(),
            const Divider(height: 24),
            _buildEditableProfileRow('성별', gender, 'gender'),
            const Divider(height: 24),
            _buildEditableProfileRow('혈액형', bloodType, 'bloodType'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildEditableProfileRow(String label, String value, String field) {
    return GestureDetector(
      onTap: () => onStartEditing(field),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF8749EB),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => onClearField(field),
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: const Center(
                    child: Icon(Icons.close, size: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEditableBirthDateRow() {
    return GestureDetector(
      key: birthDateKey,
      onTap: () => onStartEditing('birthDate'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '생년월일',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                birthDate,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF8749EB),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => onClearField('birthDate'),
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: const Center(
                    child: Icon(Icons.close, size: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEditableNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('이름', style: TextStyle(color: Colors.grey, fontSize: 14)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF8749EB),
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    onChanged: onNameChanged,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => onClearField('name'),
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: const Center(
                      child: Icon(Icons.close, size: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
