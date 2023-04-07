import 'dart:io';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'course.dart';

// Define the filename for the configuration file
const configFileName = "course_config.json";

// Load the course configuration from a file
List<Course> loadConfig() {
  try {
    // Open the configuration file
    final file = File(configFileName);
    if (!file.existsSync()) {
      // If the file doesn't exist, return an empty list
      return [];
    }

    // Read the contents of the file as a string
    final jsonString = file.readAsStringSync();

    // Parse the JSON string into a List of Course objects
    final jsonData = jsonDecode(jsonString);
    return List<Course>.from(jsonData.map((courseJson) => Course.fromJson(courseJson)));
  } catch (e) {
    // If an error occurs while reading the file, return an empty list
    return [];
  }
}

// Save the course configuration to a file
Future<void> saveConfig(List<Course> courses) async {
  try {
    // Open the configuration file for writing
    final file = File(configFileName).openWrite();

    // Write the JSON-encoded course data to the file
    final jsonData = courses.map((course) => course.toJson()).toList();
    final jsonString = jsonEncode(jsonData);
    file.write(jsonString);

    // Close the file
    await file.close();
  } catch (e) {
    // If an error occurs while writing the file, print the error message
    if (kDebugMode) {
      print("Error saving course configuration: $e");
    }
  }
}