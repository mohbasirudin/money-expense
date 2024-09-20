import 'package:intl/intl.dart';

class Func {
  static String formatter(
    String value, {
    String? oldFormat,
    String? newFormat,
  }) {
    try {
      // final time = DateTime.parse(value).toLocal();
      // var format = DateFormat("EEEE, dd MMMM yyyy","id_ID").format(time);
      // return format;
      print("cdate: $value");
      final format = DateFormat(newFormat ?? "dd MM yyyy", "id_ID");
      final dateTime = DateFormat(
        oldFormat ?? "yyyy-MM-dd HH:mm:ss",
      ).parse(value);
      return format.format(dateTime);
    } catch (e) {
      print("error: $e");
      return value;
    }
  }
}
