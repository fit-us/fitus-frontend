import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showDatePickerModal({
  required BuildContext context,
  required VoidCallback onCancel,
  required Function(DateTime) onDateChanged,
  required Rect? anchorRect,
}) {
  DateTime initialDate = DateTime(2000, 4, 2);

  int selectedYear = initialDate.year;
  int selectedMonth = initialDate.month;
  int selectedDay = initialDate.day;

  final List<int> years = List.generate(
    DateTime.now().year - 1990 + 1,
    (index) => 1990 + index,
  );

  final List<int> months = List.generate(12, (index) => index + 1);

  // 현재 보기 모드 (0: 캘린더, 1: 년도 휠, 2: 월 휠)
  int viewMode = 0;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          Widget yearPicker = CupertinoPicker(
            itemExtent: 40,
            onSelectedItemChanged: (index) {
              setState(() {
                selectedYear = years[index];
              });
            },
            scrollController: FixedExtentScrollController(
              initialItem: years.indexOf(selectedYear),
            ),
            children:
                years.map((year) {
                  return Center(
                    child: Text('$year년', style: const TextStyle(fontSize: 16)),
                  );
                }).toList(),
          );

          Widget monthPicker = CupertinoPicker(
            itemExtent: 40,
            onSelectedItemChanged: (index) {
              setState(() {
                selectedMonth = months[index];
              });
            },
            scrollController: FixedExtentScrollController(
              initialItem: months.indexOf(selectedMonth),
            ),
            children:
                months.map((month) {
                  return Center(
                    child: Text(
                      '$month월',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
          );

          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
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
                            final selectedDate = DateTime(
                              selectedYear,
                              selectedMonth,
                              selectedDay,
                            );
                            Navigator.pop(context);
                            onDateChanged(selectedDate);
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

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        viewMode = viewMode == 0 ? 1 : 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$selectedYear년 $selectedMonth월',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            viewMode == 0
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (viewMode == 0)
                    // 캘린더 뷰
                    Expanded(
                      child: _buildCalendarView(
                        year: selectedYear,
                        month: selectedMonth,
                        selectedDay: selectedDay,
                        onDaySelected: (day) {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                      ),
                    )
                  else
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      viewMode = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              viewMode == 1
                                                  ? Colors.deepPurple
                                                  : Colors.transparent,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '년도',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              viewMode == 1
                                                  ? Colors.deepPurple
                                                  : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      viewMode = 2;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              viewMode == 2
                                                  ? Colors.deepPurple
                                                  : Colors.transparent,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '월',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              viewMode == 2
                                                  ? Colors.deepPurple
                                                  : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: viewMode == 1 ? yearPicker : monthPicker,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

// 캘린더 뷰
Widget _buildCalendarView({
  required int year,
  required int month,
  required int selectedDay,
  required Function(int) onDaySelected,
}) {
  final firstDayOfMonth = DateTime(year, month, 1);

  final lastDayOfMonth = DateTime(year, month + 1, 0);

  final firstWeekday = firstDayOfMonth.weekday;

  final daysInMonth = lastDayOfMonth.day;

  final weeksInMonth = ((firstWeekday + daysInMonth - 1) / 7).ceil();

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('일', style: TextStyle(color: Colors.red)),
            Text('월'),
            Text('화'),
            Text('수'),
            Text('목'),
            Text('금'),
            Text('토', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),

      // 캘린더 그리드
      Expanded(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.0,
          ),
          itemCount: weeksInMonth * 7,
          itemBuilder: (context, index) {
            final adjustedIndex = index - (firstWeekday % 7);
            final day = adjustedIndex + 1;

            if (adjustedIndex < 0 || day > daysInMonth) {
              return const SizedBox.shrink();
            }

            final isSelected = day == selectedDay;

            return GestureDetector(
              onTap: () => onDaySelected(day),
              child: Container(
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFFE6E0FA) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$day',
                    style: TextStyle(
                      color:
                          isSelected ? const Color(0xFF8749EB) : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget buildDateEditingModal({
  required BuildContext context,
  required VoidCallback onCancel,
  required Function(DateTime) onDateChanged,
}) {
  return const SizedBox.shrink();
}
