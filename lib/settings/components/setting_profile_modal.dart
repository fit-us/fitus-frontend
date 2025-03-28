import 'package:flutter/material.dart';

void showNameEditingModal({
  required BuildContext context,
  required VoidCallback onCancel,
  required VoidCallback onSave,
  required TextEditingController nameController,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onCancel();
                    },
                    child: const Text(
                      '취소',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  const Text(
                    '이름 편집',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onSave();
                    },
                    child: const Text(
                      '완료',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '이름을 입력하세요',
                ),
                autofocus: true,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildEditingModal({
  required BuildContext context,
  required String currentField,
  required TextEditingController nameController,
  required String gender,
  required String bloodType,
  required VoidCallback onCancel,
  required VoidCallback onSaveName,
  required Function(String) onSelectGender,
  required Function(String) onSelectBloodType,
  required Function(DateTime) onDateChanged,
}) {
  return const SizedBox.shrink();
}
