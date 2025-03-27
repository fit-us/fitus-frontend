import 'package:flutter/material.dart';

Widget buildSettingItem(
  String title, {
  required VoidCallback onTap,
  Color? textColor,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    ),
  );
}

Widget buildToggleSettingItem(
  String title,
  bool value,
  ValueChanged<bool> onChanged,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          activeTrackColor: Colors.deepPurple,
        ),
      ],
    ),
  );
}

Widget buildSelectionOption(String title, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE6E0FA) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? const Color(0xFF8749EB) : Colors.black,
          ),
        ),
      ),
    ),
  );
}

Widget buildBloodTypeOption(
  String type,
  bool isSelected,
  Function(String) onSelect,
) {
  return GestureDetector(
    onTap: () => onSelect(type),
    child: Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE6E0FA) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? const Color(0xFF8749EB) : Colors.grey.shade300,
        ),
      ),
      child: Center(
        child: Text(
          type,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? const Color(0xFF8749EB) : Colors.black,
          ),
        ),
      ),
    ),
  );
}
