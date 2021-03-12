import 'package:intl/intl.dart';

class ConvertUtils {
  static String amount(double value) {
    final numberFormatter = NumberFormat('###,##0.0', 'en_ng');

    return numberFormatter.format(value ?? 0);
  }
}
