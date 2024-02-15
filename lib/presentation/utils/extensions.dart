import 'package:intl/intl.dart';

extension Amount on double {
  String amountInt() {
    var formatter = NumberFormat("#,##0.00");
    final value = formatter.format(this);

    return value;
  }
}

extension NameAbbreviation on String {
  String getAbbreviation() {
    if (isEmpty) {
      return "";
    } else {
      List<String> names = split(" ");
      return names.map((name) => name[0]).join('');
    }
  }
}
