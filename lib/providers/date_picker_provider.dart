import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:in_date_utils/in_date_utils.dart';

class DatePickerProvider extends ChangeNotifier {
  final DateTime _currentDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  DateTime get currentDate => _currentDate;

  Set<DateTime> _selectedDates = LinkedHashSet(
    equals: DateUtils.isSameDay,
    hashCode: (DateTime E) {
      return E.hashCode;
    },
  );

  bool _singleDateSelection = true;

  bool _singleMonthSelection = true;

  set singleMonthSelection(bool value) {
    _singleMonthSelection = value;
    notifyListeners();
  }

  bool get singleMonthSelection => _singleMonthSelection;

  set singleDateSelection(bool value) {
    _singleDateSelection = value;
    notifyListeners();
  }

  bool get singleDateSelection => _singleDateSelection;

  int _dayIndex;

  LinkedHashSet<DateTime> get selectedDates => _selectedDates;

  set dayIndex(int value) {
    _dayIndex = value;
    notifyListeners();
  }

  int get dayIndex => _dayIndex;

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

  DateTime get firstDayOfMonth => DateUtils.firstDayOfMonth(currentDate);

  DateTime get lastDayOfMonth => DateUtils.lastDayOfMonth(currentDate);

  DateTime get firstDayOfYear => DateUtils.firstDayOfYear(currentDate);

  DateTime get lastDayOfYear => DateUtils.lastDayOfYear(currentDate);

  void onMonthlyDatePickerDaySelected(
      DateTime selectedDay, DateTime focusedDay) {
    if (singleDateSelection) {
      if (!DateUtils.isSameDay(selectedDate, selectedDay)) {
        selectedDate = selectedDay;
      }
    } else {
      if (selectedDates.length < 2) {
        if (selectedDates.contains(selectedDay)) {
          selectedDates.remove(selectedDay);
        } else {
          selectedDates.add(selectedDay);
        }
      } else {
        if (selectedDates.contains(selectedDay)) {
          selectedDates.remove(selectedDay);
        }
      }
    }
    focusedDate = focusedDay;
    notifyListeners();
  }

  bool selectedDayPredicate(DateTime day) {
    return singleDateSelection
        ? DateUtils.isSameDay(day, selectedDate)
        : selectedDates.contains(day);
  }

  void reset() {
    dayIndex = null;
    focusedDate = DateTime.now();
    selectedDate = DateTime.now();
    _selectedDates = LinkedHashSet(
      equals: DateUtils.isSameDay,
      hashCode: (DateTime E) {
        return E.hashCode;
      },
    );
    notifyListeners();
  }
}
