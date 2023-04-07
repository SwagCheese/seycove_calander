import 'package:flutter/material.dart';
import 'files.dart';

List<Widget> dailyCourses = loadConfig();

class Course extends StatelessWidget {
  final String name;
  final Block block;
  final int roomNumber;
  final List<TimeOfDay?> time;
  Course(this.name, this.roomNumber, this.block, [List<TimeOfDay>? time]) : time = block.getTime(); // not sure how to fix this warning

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      json['name'],
      json['roomNumber'],
      Block.values[json['block']],
      List<TimeOfDay>.from(json['time'].map((timeJson) => TimeOfDay.fromDateTime(DateTime.parse(timeJson)))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'block': block.index,
      'roomNumber': roomNumber,
      'time': time
    };
  }
  
  @override
  Widget build(BuildContext context) {
    if (block.getBlockNum() != 0) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Container(
          width: 325,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Center(child: Text(block.getBlockNumString(),
                        style: const TextStyle(fontSize: 50))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(name, style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                        ),
                        Text("Room $roomNumber",
                            style: const TextStyle(fontSize: 15, color: Colors
                                .white))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 4,
              color: Colors.blue[800],
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 50, color: Colors.blue[400]),
          ),
          Expanded(
            child: Container(
              height: 4,
              color: Colors.blue[800],
            ),
          ),
        ],
      )
    );
  }

  String getTimeString(BuildContext context, String separator) {
    return "${time[0]?.format(context)}$separator${time[1]?.format(context)}";
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
  fourth,
  xBlock;

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

  String getBlockNumString() {
    int blockNum = getBlockNum();
    return blockNum != 0 ? blockNum.toString() : "";
  }

  List<TimeOfDay?> getTime() {
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
      case Block.xBlock:
        return [null, null]; // we don't know the time of x block classes
    }
  }
}