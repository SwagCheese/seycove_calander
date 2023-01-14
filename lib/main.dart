import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'course.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
   Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      appBar: CalendarAgenda(
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 100)),
        lastDate: DateTime.now().add(const Duration(days: 100)),
        onDateSelected: changeCourses,
        appbar: true,
      ),
      body: Center(
        child: ListView(
          children: dailyCourses,
        ),
      ),
    );
  }
}

