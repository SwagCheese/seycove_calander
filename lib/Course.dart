import 'package:flutter/material.dart';

List<Widget> dailyCourses = [
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
  const Course(),
];

class Course extends StatelessWidget {
  const Course({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        child: const Text(
          textAlign: TextAlign.left,
          'Course, Block, Time', // TODO input course info etc.
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

void changeCourses(DateTime day) {
  // TODO: get classes for given day and update dailyCourses
}