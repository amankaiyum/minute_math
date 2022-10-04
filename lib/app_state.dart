import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _DaysPlayed = prefs.getInt('ff_DaysPlayed') ?? _DaysPlayed;
    _AvgDailyScore = prefs.getDouble('ff_AvgDailyScore') ?? _AvgDailyScore;
    _timeTrialHighestScore = prefs
            .getStringList('ff_timeTrialHighestScore')
            ?.map(double.parse)
            .toList() ??
        _timeTrialHighestScore;
  }

  late SharedPreferences prefs;

  String userAnswer = '';

  int currentScore = 0;

  String currentQuestion = '';

  List<String> operation = ['+', '-', '*', '/'];

  int trialScore = 0;

  List<String> TimeTrialLevels = [
    'Easy',
    'Medium',
    'Hard',
    'Very Hard',
    'Hell'
  ];

  int _DaysPlayed = 0;
  int get DaysPlayed => _DaysPlayed;
  set DaysPlayed(int _value) {
    _DaysPlayed = _value;
    prefs.setInt('ff_DaysPlayed', _value);
  }

  double _AvgDailyScore = 0.0;
  double get AvgDailyScore => _AvgDailyScore;
  set AvgDailyScore(double _value) {
    _AvgDailyScore = _value;
    prefs.setDouble('ff_AvgDailyScore', _value);
  }

  List<double> _timeTrialHighestScore = [5, 4, 3, 2, 1];
  List<double> get timeTrialHighestScore => _timeTrialHighestScore;
  set timeTrialHighestScore(List<double> _value) {
    _timeTrialHighestScore = _value;
    prefs.setStringList(
        'ff_timeTrialHighestScore', _value.map((x) => x.toString()).toList());
  }

  void addToTimeTrialHighestScore(double _value) {
    _timeTrialHighestScore.add(_value);
    prefs.setStringList('ff_timeTrialHighestScore',
        _timeTrialHighestScore.map((x) => x.toString()).toList());
  }

  void removeFromTimeTrialHighestScore(double _value) {
    _timeTrialHighestScore.remove(_value);
    prefs.setStringList('ff_timeTrialHighestScore',
        _timeTrialHighestScore.map((x) => x.toString()).toList());
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
