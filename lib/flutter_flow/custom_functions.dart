import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int generateRandomCode() {
  return math.Random().nextInt(9000) + 1000;
}

int generateRandomOffset() {
  return math.Random().nextInt(10000);
}

int? calculateNewScore(
  int? currentScore,
  int? currentValue,
  bool? correct,
) {
  //return currentScore + (correct ? 1 : -1) * currentValue;
}

bool isNotNullOrEmpty(String? question) {
  // return whether a string is not null or empty
  return question != null && question.isNotEmpty;
}

String generateRandomQuestion(String difficulty) {
  //1 op 2 single digit
  if (difficulty == "Easy") {
    int num1 = math.Random().nextInt(10);
    int num2 = math.Random().nextInt(10);
    return "$num1 + $num2";
  }
  if (difficulty == "Medium") {
    int num1 = math.Random().nextInt(100);
    int num2 = math.Random().nextInt(10);
    return "$num1 + $num2";
  }
  if (difficulty == "Hard") {
    int num1 = math.Random().nextInt(100);
    int num2 = math.Random().nextInt(100);
    return "$num1 + $num2";
  }
  if (difficulty == "Very Hard") {
    int num1 = math.Random().nextInt(1000);
    int num2 = math.Random().nextInt(1000);
    return "$num1 + $num2";
  }
  if (difficulty == "Hell") {
    int num1 = math.Random().nextInt(100);
    int num2 = math.Random().nextInt(100);
    int num3 = math.Random().nextInt(100);
    return "$num1 + $num2 + $num3";
  } else {
    return "0 + 0";
  }
  // Add your function code here!
}

String updateAnswer(
  String? currentnum,
  String? num,
) {
  return "$currentnum$num";
  // Add your function code here!
}

bool isCorrect(
  String? correctAnswer,
  String? playerAnswer,
) {
  // Add your function code here!
  return '$correctAnswer' == '$playerAnswer';
}

String questionSolver(String currentQuestion) {
  // Add your function code here!
  var splits =
      currentQuestion.split("+"); // split expression to list of addends
  int answer = 0; // store answer
  for (int i = 0; i < splits.length; i++) {
    answer = answer + int.parse(splits[i]);
  }
  return answer.toString();
}

String? isDaily(bool isdaily) {
  // Add your function code here!
  if (isdaily) {
    return "Your Time was";
  } else {
    "Your Score was";
  }
}

double progressBar(
  int current,
  int totalQuestion,
) {
  // Add your function code here!
  return (current / totalQuestion);
}

double calculateNewAverageDailyScore(
  double previousAvg,
  int daysPlayed,
) {
  // Add your function code here!

  return previousAvg;
}
