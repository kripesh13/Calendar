import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:test/calendarModule/selected_calendar/selected_clander_state.dart';
import 'package:test/home/home_state.dart';
import 'package:test/location_provider/location_name_provider.dart';
import 'package:test/location_provider/location_provider.dart';
import 'package:test/location_provider/location_screen.dart';

void main() {
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.light
    ..maskType = EasyLoadingMaskType.black // Fully block user interaction
    ..userInteractions = false // Prevent all user interactions
    ..dismissOnTap = false; // Do not dismiss on tap
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeState()),
        ChangeNotifierProvider(create: (_) => SelectedClanderState()),
        ChangeNotifierProvider(create: (_) => LocationNameProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: const HomeScreen(),
        ),
        builder: EasyLoading.init(),
      ),
    );
  }
}
