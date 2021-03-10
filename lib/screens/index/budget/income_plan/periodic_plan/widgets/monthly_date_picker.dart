import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:table_calendar/table_calendar.dart';

typedef OnDaySelected = void Function(
    DateTime selectedDay, DateTime focusedDay);

typedef SelectedDayPredicate = bool Function(DateTime day);

class MonthlyDatePicker extends StatelessWidget {
  final DateTime focusedDate;
  final DateTime selectedDate;
  final DateTime fistDate;
  final DateTime lastDate;
  final OnDaySelected onDaySelected;
  final SelectedDayPredicate selectedDayPredicate;

  MonthlyDatePicker({
    Key key,
    @required this.focusedDate,
    @required this.selectedDate,
    @required this.fistDate,
    @required this.lastDate,
    @required this.onDaySelected,
    @required this.selectedDayPredicate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp) +
                EdgeInsets.only(right: 120.sp),
            alignment: Alignment.centerLeft,
            child: Text(
              'What day of the month should your plan begin?',
              style: Theme.of(context).primaryTextTheme.subtitle2,
            ),
          ),
          SizedBox(height: 24.sp),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: TableCalendar(
              focusedDay: focusedDate,
              firstDay: fistDate,
              lastDay: lastDate,
              calendarFormat: CalendarFormat.month,
              headerVisible: false,
              daysOfWeekVisible: false,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
              ),
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
          ),
        ],
      ),
    );
  }
}
