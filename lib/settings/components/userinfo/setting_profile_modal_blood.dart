import 'package:flutter/material.dart';

void showBloodTypeSelectionModal({
  required BuildContext context,
  required VoidCallback onCancel,
  required String currentBloodType,
  required Function(String) onSelectBloodType,
}) {
  final bool isRhPositive = !currentBloodType.contains('RH-');
  final String bloodGroup =
      currentBloodType.contains('A')
          ? 'A'
          : currentBloodType.contains('B')
          ? 'B'
          : currentBloodType.contains('O')
          ? 'O'
          : currentBloodType.contains('AB')
          ? 'AB'
          : '';

  // 혈액형 선택 함수
  void selectBloodType(String rh, String group) {
    Navigator.pop(context);
    onSelectBloodType('$rh $group');
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        onCancel();
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildRadioOption(
                            'RH+',
                            isRhPositive,
                            () => selectBloodType('RH+', bloodGroup),
                          ),
                          const SizedBox(width: 40),
                          _buildRadioOption(
                            'RH-',
                            !isRhPositive,
                            () => selectBloodType('RH-', bloodGroup),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 8),
                      _buildBloodGroupOption(
                        'A',
                        bloodGroup == 'A',
                        () =>
                            selectBloodType(isRhPositive ? 'RH+' : 'RH-', 'A'),
                      ),
                      const SizedBox(height: 8),
                      _buildBloodGroupOption(
                        'B',
                        bloodGroup == 'B',
                        () =>
                            selectBloodType(isRhPositive ? 'RH+' : 'RH-', 'B'),
                      ),
                      const SizedBox(height: 8),
                      _buildBloodGroupOption(
                        'O',
                        bloodGroup == 'O',
                        () =>
                            selectBloodType(isRhPositive ? 'RH+' : 'RH-', 'O'),
                      ),
                      const SizedBox(height: 8),
                      _buildBloodGroupOption(
                        'AB',
                        bloodGroup == 'AB',
                        () =>
                            selectBloodType(isRhPositive ? 'RH+' : 'RH-', 'AB'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildRadioOption(String label, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
            border: Border.all(
              color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child:
              isSelected
                  ? const Center(
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.white,
                    ),
                  )
                  : null,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? Colors.deepPurple : Colors.black,
          ),
        ),
      ],
    ),
  );
}

Widget _buildBloodGroupOption(
  String type,
  bool isSelected,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade200 : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          type,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.black : Colors.black,
          ),
        ),
      ),
    ),
  );
}

Widget buildBloodTypeSelectionModal({
  required BuildContext context,
  required VoidCallback onCancel,
  required String currentBloodType,
  required Function(String) onSelectBloodType,
}) {
  showBloodTypeSelectionModal(
    context: context,
    onCancel: onCancel,
    currentBloodType: currentBloodType,
    onSelectBloodType: onSelectBloodType,
  );

  return const SizedBox.shrink();
}
