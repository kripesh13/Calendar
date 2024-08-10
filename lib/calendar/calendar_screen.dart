import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: HeatMap(
            datasets: {
              DateTime(2024, 8, 6): 3,
              DateTime(2024, 8, 7): 7,
              DateTime(2024, 8, 8): 10,
              DateTime(2024, 8, 9): 13,
              DateTime(2024, 8, 13): 12,
            },
            startDate: DateTime.now(),
            endDate: DateTime.now().add(Duration(days: 60)),
            colorMode: ColorMode.opacity,
         
            margin: EdgeInsets.all(5),
            showText: true,
            scrollable: true,
            colorsets: const {
              1: Color.fromARGB(20, 19, 214, 25),
              2: Color.fromARGB(40, 19, 214, 25),
              3: Color.fromARGB(60, 19, 214, 25),
              4: Color.fromARGB(80, 19, 214, 25),
              5: Color.fromARGB(100, 19, 214, 25),
              6: Color.fromARGB(120, 19, 214, 25),
              7: Color.fromARGB(140, 19, 214, 25),
              8: Color.fromARGB(160, 19, 214, 25),
              9: Color.fromARGB(180, 19, 214, 25),
              10: Color.fromARGB(200, 19, 214, 25),
              11: Color.fromARGB(220, 19, 214, 25),
              12: Color.fromARGB(240, 19, 214, 25),
              13: Color.fromARGB(255, 19, 214, 25),
            },
            onClick: (value) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(value.toString())));
            },
          ),
        ),
      ],
    ));
  }
}
