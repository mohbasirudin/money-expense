import 'package:intl/intl.dart';

class Func {
  static String formatter(
    String value, {
    String? oldFormat,
    String? newFormat,
  }) {
    try {
      final format = DateFormat(newFormat ?? "dd MM yyyy", "id_ID");
      final dateTime = DateFormat(
        oldFormat ?? "yyyy-MM-dd HH:mm:ss",
      ).parse(value);
      return format.format(dateTime);
    } catch (e) {
      return value;
    }
  }

}
