import 'package:intl/intl.dart';
import 'package:moneyexpense/app/helper/extension/string_ext.dart';

extension NumExt on num {
  String toRp() {
    try {
      NumberFormat nf = NumberFormat.simpleCurrency(
        locale: "id",
        decimalDigits: 0,
      );

      var data = nf.format(this).lower().replaceAll("rp", "Rp. ");
      return data;
    } catch (e) {
      return toString();
    }
  }
}
