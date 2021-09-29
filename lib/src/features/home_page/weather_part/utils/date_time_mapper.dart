class DateTineMapper {
  static String dateMapToString(DateTime date) =>
      '${_pad(date.day)}.${_pad(date.month)}.${_pad(date.year)}';
  static String timeMapToString(DateTime time) =>
      '${_pad(time.hour)}:${_pad(time.minute)}:${_pad(time.second)}';

  static String dateTimeToString(DateTime dateTime) =>
      '${dateMapToString(dateTime)} ${timeMapToString(dateTime)}';

  static String _pad(int value) {
    return '$value'.padLeft(2, '0');
  }
}
