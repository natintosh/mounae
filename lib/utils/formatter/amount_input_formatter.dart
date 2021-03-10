import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AmountInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    if (newValue.text.length > 1) {
      value = value * pow(10, newValue.text.split('.')[1].length);
    }

    final formatter = NumberFormat('#,##0.00', 'en-ng');

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length,
      ),
    );
  }
}
