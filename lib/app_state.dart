import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userAnswer = '';
  String get userAnswer => _userAnswer;
  set userAnswer(String _value) {
    _userAnswer = _value;
  }

  int _currentScore = 0;
  int get currentScore => _currentScore;
  set currentScore(int _value) {
    _currentScore = _value;
  }

  String _currentQuestion = '';
  String get currentQuestion => _currentQuestion;
  set currentQuestion(String _value) {
    _currentQuestion = _value;
  }

  int _trialScore = 0;
  int get trialScore => _trialScore;
  set trialScore(int _value) {
    _trialScore = _value;
  }

  int _multiplayerscore = 0;
  int get multiplayerscore => _multiplayerscore;
  set multiplayerscore(int _value) {
    _multiplayerscore = _value;
  }

  List<String> _multiplayerQuestonList = [];
  List<String> get multiplayerQuestonList => _multiplayerQuestonList;
  set multiplayerQuestonList(List<String> _value) {
    _multiplayerQuestonList = _value;
  }

  void addToMultiplayerQuestonList(String _value) {
    _multiplayerQuestonList.add(_value);
  }

  void removeFromMultiplayerQuestonList(String _value) {
    _multiplayerQuestonList.remove(_value);
  }

  void removeAtIndexFromMultiplayerQuestonList(int _index) {
    _multiplayerQuestonList.removeAt(_index);
  }

  int _round = 0;
  int get round => _round;
  set round(int _value) {
    _round = _value;
  }

  bool _editIcon = true;
  bool get editIcon => _editIcon;
  set editIcon(bool _value) {
    _editIcon = _value;
  }

  int _currQuestion = 0;
  int get currQuestion => _currQuestion;
  set currQuestion(int _value) {
    _currQuestion = _value;
  }

  bool _dsCompleted = false;
  bool get dsCompleted => _dsCompleted;
  set dsCompleted(bool _value) {
    _dsCompleted = _value;
  }

  bool _ds30sCompleted = false;
  bool get ds30sCompleted => _ds30sCompleted;
  set ds30sCompleted(bool _value) {
    _ds30sCompleted = _value;
  }

  bool _ds15sCompleted = false;
  bool get ds15sCompleted => _ds15sCompleted;
  set ds15sCompleted(bool _value) {
    _ds15sCompleted = _value;
  }

  DateTime? _dsResetTime = DateTime.fromMillisecondsSinceEpoch(1671135960000);
  DateTime? get dsResetTime => _dsResetTime;
  set dsResetTime(DateTime? _value) {
    _dsResetTime = _value;
  }

  DateTime? _ds15sResetTime =
      DateTime.fromMillisecondsSinceEpoch(1671135960000);
  DateTime? get ds15sResetTime => _ds15sResetTime;
  set ds15sResetTime(DateTime? _value) {
    _ds15sResetTime = _value;
  }

  DateTime? _ds30sResetTime =
      DateTime.fromMillisecondsSinceEpoch(1671135960000);
  DateTime? get ds30sResetTime => _ds30sResetTime;
  set ds30sResetTime(DateTime? _value) {
    _ds30sResetTime = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
