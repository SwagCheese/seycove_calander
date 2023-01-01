import 'package:flutter/material.dart';

List<Widget> dailyCourses = [
  const Course("English", Block.first),
  const Course("French", Block.second),
  const Course("Physics", Block.third),
  const Course("Lunch", Block.lunch),
  const Course("Woodwork", Block.fourth),
];

class Course extends StatelessWidget {
  final String name;
  final Block block;
  const Course(this.name, this.block, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Container(
        color: Colors.white,
        height: 100,
        alignment: Alignment.centerLeft,
        child: Text(
          textAlign: TextAlign.left,
          "$name${block.getBlockNumString("(", ")")} ${block.getTimeString(context, " - ")}", // TODO nicer formatting
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

void changeCourses(DateTime day) {
  // TODO: get classes for given day and update dailyCourses
}

enum Block {
  first,
  second,
  third,
  lunch,
  fourth;

  int getBlockNum() {
    switch (this) {
      case Block.first:
        return 1;
      case Block.second:
        return 2;
      case Block.third:
        return 3;
      case Block.fourth:
        return 4;
      default:
        return 0;
    }
  }

  String getBlockNumString(String before, String after) {
    int blockNum = getBlockNum();
    return blockNum != 0 ? before + blockNum.toString() + after: "";
  }

  String getTimeString(BuildContext context, String separator) { // TODO: make function to get start and end times as date object then use that to make a string
    return "${getTime()[0].format(context)}$separator${getTime()[1].format(context)}";
  }

  List<TimeOfDay> getTime() {
    switch (this) {
      case Block.first:
        return [const TimeOfDay(hour: 9, minute: 12), const TimeOfDay(hour:10, minute: 22)];
      case Block.second:
        return [const TimeOfDay(hour: 10, minute: 26), const TimeOfDay(hour:11, minute: 36)];
      case Block.third:
        return [const TimeOfDay(hour: 11, minute: 40), const TimeOfDay(hour:12, minute: 40)];
      case Block.lunch:
        return [const TimeOfDay(hour: 12, minute: 40), const TimeOfDay(hour:1, minute: 50)];
      case Block.fourth:
        return [const TimeOfDay(hour: 1, minute: 50), const TimeOfDay(hour:3, minute: 00)];
    }
  }
}