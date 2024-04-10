import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2024),
      lastDay: DateTime.utc(2025),
    );
  }
}
