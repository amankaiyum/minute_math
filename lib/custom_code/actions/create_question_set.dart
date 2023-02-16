// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> createQuestionSet(
  int size,
  String difficulty,
) async {
  // Add your function code here!
  List<String> myList = [];
  for (int i = 0; i < size; i++) {
    myList.add(generateRandomQuestion(difficulty));
  }
  return myList;
}
