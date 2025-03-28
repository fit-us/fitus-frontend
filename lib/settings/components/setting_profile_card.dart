import 'package:flutter/material.dart';

Widget buildProfileCard({
  required String name,
  required String birthDate,
  required String gender,
  required String bloodType,
}) {
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

Widget buildEditableProfileCard({
  required String name,
  required String birthDate,
  required String gender,
  required String bloodType,
  required Function(String) onStartEditing,
  required Function(String) onClearField,
  required TextEditingController nameController,
  required Function(String) onNameChanged,
}) {
  return Card(
    key: const ValueKey<String>('editable_profile'),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: EdgeInsets.zero,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildEditableNameRow(nameController, onNameChanged, onClearField),
          const Divider(height: 24),
          _buildEditableProfileRow(
            '생년월일',
            birthDate,
            'birthDate',
            onStartEditing,
            onClearField,
          ),
          const Divider(height: 24),
          _buildEditableProfileRow(
            '성별',
            gender,
            'gender',
            onStartEditing,
            onClearField,
          ),
          const Divider(height: 24),
          _buildEditableProfileRow(
            '혈액형',
            bloodType,
            'bloodType',
            onStartEditing,
            onClearField,
          ),
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

Widget _buildEditableProfileRow(
  String label,
  String value,
  String field,
  Function(String) onStartEditing,
  Function(String) onClearField,
) {
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

Widget _buildEditableNameRow(
  TextEditingController nameController,
  Function(String) onNameChanged,
  Function(String) onClearField,
) {
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
