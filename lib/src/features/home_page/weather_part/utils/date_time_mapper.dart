class DateTineMapper {
  static String dateMapToString(DateTime date) =>
      '${date.day}.${date.month}.${date.year}';
  static String timeMapToString(DateTime time) =>
      '${time.hour}:${time.minute}:${time.second}';

  static String dateTimeToString(DateTime dateTime) =>
      '${dateMapToString(dateTime)} ${timeMapToString(dateTime)}';
}
