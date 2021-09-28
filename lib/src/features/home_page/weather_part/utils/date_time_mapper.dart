class DateTineMapper {
  static String dateMapToString(DateTime date) =>
      '${date.day}.${date.month}.${date.year}';
  static String timeMapToString(DateTime time) =>
      '${time.hour}:${time.minute}:${time.second}';
}
