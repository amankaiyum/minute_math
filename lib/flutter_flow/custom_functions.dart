import 'dart:convert';
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

int calculateNewScore(
  int currentScore,
  int currentValue,
) {
  return currentScore + currentValue;
}

bool isNotNullOrEmpty(String? question) {
  // return whether a string is not null or empty
  return question != null && question.isNotEmpty;
}

String generateRandomQuestion(String difficulty) {
  // difficulty argument passed as parameter
  if (difficulty == "Easy") {
    // if difficult is "Easy"
    int num1 = math.Random().nextInt(90) + 10; // 10-99
    int num2 = math.Random().nextInt(10); //0-9
    if (math.Random().nextDouble() > .50) {
      return "$num1 + $num2";
    } else {
      return "$num1 - $num2";
    }
  } else if (difficulty == "Medium") {
    if (math.Random().nextDouble() > .50) {
      int num1 = math.Random().nextInt(10);
      int num2 = math.Random().nextInt(10);
      return "$num1 * $num2";
    } else {
      int num1 = math.Random().nextInt(100);
      int num2 = math.Random().nextInt(100);
      if (math.Random().nextDouble() > .50) {
        return "$num1 + $num2";
      } else {
        if (num1 >= num2) {
          return "$num1 - $num2";
        } else {
          return "$num2 - $num1";
        }
      }
    }
  } else if (difficulty == "Hard") {
    if (math.Random().nextDouble() > .50) {
      int num1 = math.Random().nextInt(100);
      int num2 = math.Random().nextInt(10);
      return "$num1 * $num2";
    } else {
      int num1 = math.Random().nextInt(10);
      int num2 = math.Random().nextInt(10);
      int num3 = math.Random().nextInt(10);
      return "$num1 + $num2 + $num3";
    }
  } else if (difficulty == "Very Hard") {
    double rand = math.Random().nextDouble();
    if (rand < .33) {
      int num1 = math.Random().nextInt(90) + 10;
      int num2 = math.Random().nextInt(90) + 10;
      return "$num1 * $num2";
    } else if (rand > .66) {
      int num1 = math.Random().nextInt(90) + 10;
      int num2 = math.Random().nextInt(90) + 10;
      int num3 = math.Random().nextInt(90) + 10;
      return "$num1 + $num2 + $num3";
    } else {
      int num1 = math.Random().nextInt(100);
      //num2 cant be 0
      int num2 = math.Random().nextInt(9) + 1;
      int num3 = num1 * num2;
      return "$num3 / $num2";
    }
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
  // split expression to list of addends
  var splits = currentQuestion.split(' ');
  int answer = int.parse(splits[0]); // store answer
  if (splits[1] == "-") {
    for (int i = 2; i < splits.length; i += 2) {
      answer -= int.parse(splits[i]);
    }
  } else if (splits[1] == "*") {
    for (int i = 2; i < splits.length; i += 2) {
      answer *= int.parse(splits[i]);
    }
  } else if (splits[1] == "/") {
    // ~ to keep int division
    answer = int.parse(splits[0]) ~/ int.parse(splits[2]);
  } else {
    for (int i = 2; i < splits.length; i += 2) {
      answer += int.parse(splits[i]);
    }
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
  int score,
) {
  // Add your function code here!
  // use formula
  // curr avg = ((N-1)*prev avg + score )/ N where n is number of occurences
  // add 1 to days play to account for firebase desync
  return (daysPlayed * previousAvg + score) / (daysPlayed + 1);
}

int sToms(int seconds) {
  // Add your function code here!
  return (seconds * 1000);
}

double msToS(int milliseconds) {
  // Add your function code here!
  return (milliseconds / 1000);
}

List<String> testlist() {
  // Add your function code here!
  List<String> myList = ['a', 'b', 'c'];
  return myList;
}

String getCurrentQuestion(
  List<String> questionList,
  int index,
) {
  // Add your function code here!
  return questionList[index];
}

List<String> createQuestionList(
  int size,
  String difficulty,
) {
  // Add your function code here!
  List<String> myList = [];
  for (int i = 0; i < size; i++) {
    myList.add(generateRandomQuestion(difficulty));
  }
  return myList;
}

int incrementIndex(int? index) {
  // Add your function code here!
  if (index != null) {
    return index + 1;
  } else {
    return 1;
  }
}

DateTime setResetTime() {
  DateTime currTime = DateTime.now();
  DateTime resetTime = DateTime.utc(currTime.year, currTime.month, currTime.day,
      23, 59, 59); // set time to next day 12am
  return resetTime;
}
