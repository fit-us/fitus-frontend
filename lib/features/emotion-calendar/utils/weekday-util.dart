class WeekDayUtil {
  static final List<String> dayOfWeek = ['일', '월', '화', '수', '목', '금', '토'];

  static String getKRWeekDay(int weekDay) {
    return dayOfWeek[weekDay - 1];
  }
}
