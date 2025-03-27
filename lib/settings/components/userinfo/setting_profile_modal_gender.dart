import 'package:flutter/material.dart';

void showGenderSelectionModal({
  required BuildContext context,
  required VoidCallback onCancel,
  required String currentGender,
  required Function(String) onSelectGender,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.4,
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
                    const Text('', style: TextStyle(fontSize: 16)),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onSelectGender('남성');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color:
                                currentGender == '남성'
                                    ? const Color(0xFFE6E0FA)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '남성',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    currentGender == '남성'
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                color:
                                    currentGender == '남성'
                                        ? const Color(0xFF8749EB)
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onSelectGender('여성');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color:
                                currentGender == '여성'
                                    ? const Color(0xFFE6E0FA)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '여성',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    currentGender == '여성'
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                color:
                                    currentGender == '여성'
                                        ? const Color(0xFF8749EB)
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          onSelectGender('기타');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color:
                                currentGender == '기타'
                                    ? const Color(0xFFE6E0FA)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '기타',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    currentGender == '기타'
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                color:
                                    currentGender == '기타'
                                        ? const Color(0xFF8749EB)
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildGenderSelectionModal({
  required BuildContext context,
  required VoidCallback onCancel,
  required String currentGender,
  required Function(String) onSelectGender,
}) {
  return const SizedBox.shrink();
}
