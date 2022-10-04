import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePage1Widget extends StatefulWidget {
  const GamePage1Widget({Key? key}) : super(key: key);

  @override
  _GamePage1WidgetState createState() => _GamePage1WidgetState();
}

class _GamePage1WidgetState extends State<GamePage1Widget> {
  StopWatchTimer? timerController;
  String? timerValue;
  int? timerMilliseconds;
  TextEditingController? currentQuestionController;
  TextEditingController? textanswerController;

  @override
  void initState() {
    super.initState();
    currentQuestionController =
        TextEditingController(text: functions.generateRandomQuestion('Easy'));
    textanswerController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    currentQuestionController?.dispose();
    textanswerController?.dispose();
    timerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterFlowTimer(
                onInit: () {
                  timerMilliseconds ??= 0;
                  timerValue ??= StopWatchTimer.getDisplayTime(
                    0,
                    hours: true,
                    minute: true,
                    second: true,
                    milliSecond: false,
                  );
                  timerController ??= StopWatchTimer(
                    mode: StopWatchMode.countUp,
                    onChange: (value) {
                      setState(() {
                        timerMilliseconds = value;
                        timerValue = StopWatchTimer.getDisplayTime(
                          value,
                          hours: true,
                          minute: true,
                          second: true,
                          milliSecond: false,
                        );
                      });
                    },
                  );
                },
                timerValue: timerValue ??
                    StopWatchTimer.getDisplayTime(
                      0,
                      hours: true,
                      minute: true,
                      second: true,
                      milliSecond: false,
                    ),
                timer: timerController ?? StopWatchTimer(),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title1,
                onEnded: () {},
              ),
              Text(
                valueOrDefault<String>(
                  FFAppState().currentScore.toString(),
                  '0',
                ),
                style: FlutterFlowTheme.of(context).title1,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: currentQuestionController,
                  autofocus: true,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: textanswerController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'answer',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: GridView(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.7,
            ),
            scrollDirection: Axis.vertical,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  setState(() => FFAppState().userAnswer =
                      functions.updateAnswer(FFAppState().userAnswer, '1'));
                },
                text: '1',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  setState(() => FFAppState().userAnswer =
                      functions.updateAnswer(FFAppState().userAnswer, '2'));
                },
                text: '2',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  setState(() => FFAppState().userAnswer = '3');
                },
                text: '3',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  setState(() => FFAppState().userAnswer = '4');
                },
                text: '4',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: '5',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: '6',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: '7',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: '8',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: '9',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                fillColor: Colors.white,
                icon: Icon(
                  Icons.clear_outlined,
                  color: FlutterFlowTheme.of(context).customColor3,
                  size: 30,
                ),
                onPressed: () async {
                  setState(() {
                    textanswerController?.clear();
                  });
                },
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: '0',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).title1,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                fillColor: Colors.white,
                icon: FaIcon(
                  FontAwesomeIcons.angleDoubleRight,
                  color: Color(0xFF03FF00),
                  size: 30,
                ),
                onPressed: () async {
                  if (functions
                          .questionSolver(currentQuestionController!.text) ==
                      textanswerController!.text) {
                    setState(() => FFAppState().currentScore =
                        FFAppState().currentScore + 1);
                  } else {
                    setState(() => FFAppState().currentScore =
                        FFAppState().currentScore + -1);
                  }

                  setState(() => FFAppState().currentQuestion =
                      functions.generateRandomQuestion('Easy'));
                  setState(() {
                    textanswerController?.clear();
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
