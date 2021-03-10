import 'package:flutter/foundation.dart';
import 'package:in_date_utils/in_date_utils.dart';

class DatePickerProvider extends ChangeNotifier {
  final DateTime _currentDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  DateTime get currentDate => _currentDate;

  DateTime get focusedDate => _focusedDate;

  set focusedDate(DateTime value) {
    _focusedDate = value;
    notifyListeners();
  }

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  DateTime get firstDayOfMonth => DateUtils.firstDayOfMonth(focusedDate);

  DateTime get lastDayOfMonth => DateUtils.lastDayOfMonth(focusedDate);

  void onMonthlyDatePickerDaySelected(
      DateTime selectedDay, DateTime focusedDay) {
    if (!DateUtils.isSameDay(selectedDate, selectedDay)) {
      selectedDate = selectedDay;
    }
    focusedDate = focusedDay;
    notifyListeners();
  }

  bool selectedDayPredicate(DateTime day) {
    return DateUtils.isSameDay(day, selectedDate);
  }
}
