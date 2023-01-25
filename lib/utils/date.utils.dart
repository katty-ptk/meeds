import 'package:intl/intl.dart';

class DateUtil {
  final String _yyMMdd_FORMAT = 'dd/MM/yyyy';

  String formatDate( DateTime date ) {
    return DateFormat(_yyMMdd_FORMAT).format(date);
  }
}