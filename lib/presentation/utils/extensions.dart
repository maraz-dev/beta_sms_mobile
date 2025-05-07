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

extension DateTimeFormatting on DateTime {
  String toFormattedDateTime() {
    String day = this.day.toString().padLeft(2, '0');
    String month = _getMonthAbbreviation(this.month);
    String year = this.year.toString();
    String hour = (this.hour % 12).toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    String period = this.hour >= 12 ? 'PM' : 'AM';

    return '$day, $month. $year - $hour:$minute$period';
  }

  String _getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'JAN';
      case 2:
        return 'FEB';
      case 3:
        return 'MAR';
      case 4:
        return 'APR';
      case 5:
        return 'MAY';
      case 6:
        return 'JUN';
      case 7:
        return 'JUL';
      case 8:
        return 'AUG';
      case 9:
        return 'SEP';
      case 10:
        return 'OCT';
      case 11:
        return 'NOV';
      case 12:
        return 'DEC';
      default:
        return '';
    }
  }
}
