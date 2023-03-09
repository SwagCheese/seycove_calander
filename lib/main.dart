import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'course.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SeydarApp());
}

class SeydarApp extends StatelessWidget {
  const SeydarApp({super.key});
  @override
  Widget build(BuildContext context) {
    print(dailyCourses);

    if (dailyCourses.isEmpty) {
      // launch page
      return MaterialApp(
        title: 'Launch Page',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            primary: Color(0xffBB86FC),
            secondary: Color(0xff03DAC6),
            surface: Color(0xff181818),
            background: Color(0xff121212),
            error: Color(0xffCF6679),
            onPrimary: Color(0xff000000),
            onSecondary: Color(0xff000000),
            onSurface: Color(0xffffffff),
            onBackground: Color(0xffffffff),
            onError: Color(0xff000000),
            brightness: Brightness.dark,
          ),
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(title: 'Launch UI'),
      );
    } else {
      // main page
      return MaterialApp(
        title: 'Seycove Calendar App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: const MainView(title: 'Seycove Calendar App,'),
      );
    }
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
        selectedDayPosition: SelectedDayPosition.left,
        appbar: true,
      ),
      body: Center(
        child: ListView(children: dailyCourses),
      ),
    );
  }
}