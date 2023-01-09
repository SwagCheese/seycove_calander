import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'course.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seycove Calander App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.white,

      ),
      home: const MainView(title: 'Seycove Calander App),'),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key, required this.title});

  final String title;

  @override
  State<MainView> createState() => _MainView();
}

class _MainView extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar
      (
        accent: const Color(0xFF0039D9), // this is the default accent but I put it here for easy access
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        selectedDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        onDateChanged: changeCourses,

        backButton: false,
      ),
      body: Center(
        child: ListView(
          children: dailyCourses,
        ),
      ),
    );
  }
}