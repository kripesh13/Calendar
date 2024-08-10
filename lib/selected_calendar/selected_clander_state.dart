import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectedClanderState extends ChangeNotifier {
  SelectedClanderState() {
    fetchHolidays();
  }

  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<DateTime> holidays = []; // Add holidays list

  // Method to fetch holidays from API
  Future<void> fetchHolidays() async {
    // Example: Replace this with your API call to fetch holidays
    // For now, let's add a couple of hardcoded holidays
    holidays = [
      DateTime.utc(2024, 8, 25),
      DateTime.utc(2024, 9, 1),
      // Add more holidays from API
    ];
    notifyListeners();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay = selectedDay;
    this.focusedDay = focusedDay;
    notifyListeners();
  }

  void onFormatChanged(CalendarFormat format) {
    if (calendarFormat != format) {
      calendarFormat = format;
      notifyListeners();
    }
  }

  void onPageChanged(DateTime focusedDay) {
    this.focusedDay = focusedDay;
    notifyListeners();
  }
}
