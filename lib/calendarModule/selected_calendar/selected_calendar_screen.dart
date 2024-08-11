import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test/calendarModule/selected_calendar/selected_clander_state.dart';

class SelectedCalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SelectedClanderState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Calendar'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        height: 500,
        child: Column(
          children: [
            // Custom header with dropdown
            Container(
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.white),
                    onPressed: () {
                      state.onPageChanged(DateTime(
                        state.focusedDay.year,
                        state.focusedDay.month - 1,
                      ));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton<int>(
                        value: state.focusedDay.year,
                        dropdownColor: Colors.black87,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(),
                        items: List.generate(21, (index) {
                          int year = 2010 + index;
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }),
                        onChanged: (value) {
                          if (value != null) {
                            final newFocusedDay = DateTime(value,
                                state.focusedDay.month, state.focusedDay.day);
                            state.onPageChanged(newFocusedDay);
                          }
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        DateFormat.MMMM().format(state.focusedDay),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, color: Colors.white),
                    onPressed: () {
                      state.onPageChanged(DateTime(
                        state.focusedDay.year,
                        state.focusedDay.month + 1,
                      ));
                    },
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 10.0),
            Container(
              height: 320,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: TableCalendar(
                rowHeight: 50,
                firstDay: DateTime.utc(2010, 1, 1),
                lastDay: DateTime.utc(2030, 12, 30),
                focusedDay: state.focusedDay,
                calendarFormat: state.calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(state.selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  state.onDaySelected(selectedDay, focusedDay);
                },
                onFormatChanged: (format) {
                  state.onFormatChanged(format);
                },
                onPageChanged: (focusedDay) {
                  state.onPageChanged(focusedDay);
                },
                headerVisible: false, // Hide default header
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {
                    final text = DateFormat.E().format(day);

                    if (day.weekday == DateTime.saturday) {
                      return Center(
                        child: Text(
                          text.toString(),
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }

                    return Center(
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  defaultBuilder: (context, day, focusedDay) {
                    // Highlight holidays
                    if (state.holidays.contains(day)) {
                      return Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }

                    // Color for Saturday
                    if (day.weekday == DateTime.saturday) {
                      return Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }

                    return Center(
                      child: Text(
                        day.day.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, date, focusedDay) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        date.day.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
