import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fapp/entities/emotion/models/emotion-types.dart';
import 'package:fapp/features/emotion-calendar/ui/emotion-calendar-cell.dart';
import 'package:fapp/features/emotion-calendar/ui/emotion-calendar-navtop.dart';
import 'package:fapp/features/emotion-calendar/utils/weekday-util.dart';

class EmotionCalendarPage extends StatefulWidget {
  const EmotionCalendarPage({Key? key}) : super(key: key);

  @override
  State<EmotionCalendarPage> createState() => _EmotionCalendarPageState();
}

class _EmotionCalendarPageState extends State<EmotionCalendarPage> {
  final Map<DateTime, EmotionTypes> emotionData = {
    DateTime(2025, 3, 1): EmotionTypes.veryUnpleasant,
    DateTime(2025, 3, 2): EmotionTypes.unpleasant,
    DateTime(2025, 3, 3): EmotionTypes.littleUnpleasant,
    DateTime(2025, 3, 4): EmotionTypes.normal,
    DateTime(2025, 3, 5): EmotionTypes.littlePleasant,
    DateTime(2025, 3, 6): EmotionTypes.pleasant,
    DateTime(2025, 3, 7): EmotionTypes.veryPleasant,
  };

  DateTime _focusedDay = DateTime(2025, 3, 1);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Align(
        alignment: Alignment.topCenter,

        child: Container(
          height: MediaQuery.of(context).size.height * 0.95, // 위에 15% 여백
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EmotionCalendarNavTop(),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        WeekDayUtil.dayOfWeek
                            .map((dayOfWeek) => Text(dayOfWeek))
                            .toList(),
                  ),

                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          '${_focusedDay.month}월',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  Expanded(
                    child: TableCalendar(
                      focusedDay: _focusedDay,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      headerVisible: false,
                      rowHeight: 94,
                      daysOfWeekHeight: 0,
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        cellMargin: EdgeInsets.zero,
                      ),
                      onPageChanged: (day) => setState(() => _focusedDay = day),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          return EmotionCalendarCell(
                            day: day,
                            emotion:
                                emotionData[DateTime(
                                  day.year,
                                  day.month,
                                  day.day,
                                )],
                          );
                        },
                        todayBuilder: (context, day, focusedDay) {
                          return EmotionCalendarCell(
                            day: day,
                            emotion:
                                emotionData[DateTime(
                                  day.year,
                                  day.month,
                                  day.day,
                                )],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
