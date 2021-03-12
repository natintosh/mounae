import 'package:intl/intl.dart';

class ConvertUtils {
  static String amount(double value) {
    final numberFormatter = NumberFormat('###,##0.00', 'en_ng');

    return numberFormatter.format(value ?? 0);
  }
}
