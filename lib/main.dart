import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/calendar/calendar_screen.dart';
import 'package:test/home/home_screen.dart';
import 'package:test/home/home_state.dart';
import 'package:test/more.dart';
import 'package:test/selected_calendar/selected_calendar_screen.dart';
import 'package:test/selected_calendar/selected_clander_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeState()),
        ChangeNotifierProvider(create: (_) => SelectedClanderState())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SelectedCalendarScreen(),
      ),
    );
  }
}
