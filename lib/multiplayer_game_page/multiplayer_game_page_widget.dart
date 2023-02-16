import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../endgame/endgame_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'multiplayer_game_page_model.dart';
export 'multiplayer_game_page_model.dart';

class MultiplayerGamePageWidget extends StatefulWidget {
  const MultiplayerGamePageWidget({
    Key? key,
    this.roomdetails,
    this.levelDifficulty,
  }) : super(key: key);

  final DocumentReference? roomdetails;
  final String? levelDifficulty;

  @override
  _MultiplayerGamePageWidgetState createState() =>
      _MultiplayerGamePageWidgetState();
}

class _MultiplayerGamePageWidgetState extends State<MultiplayerGamePageWidget> {
  late MultiplayerGamePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiplayerGamePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onExecute.add(StopWatchExecute.start);
    });

    _model.currentQController = TextEditingController();
    _model.userAnswerTextController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<RoomsRecord>>(
      stream: queryRoomsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<RoomsRecord> multiplayerGamePageRoomsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final multiplayerGamePageRoomsRecord =
            multiplayerGamePageRoomsRecordList.isNotEmpty
                ? multiplayerGamePageRoomsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
                FFAppState().update(() {
                  FFAppState().currentQuestion = '';
                  FFAppState().trialScore = 0;
                });
                FFAppState().update(() {
                  FFAppState().userAnswer = '';
                });
              },
            ),
            title: Text(
              'Multiplayer :${widget.levelDifficulty}',
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: StreamBuilder<RoomsRecord>(
                stream: RoomsRecord.getDocument(widget.roomdetails!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  final columnRoomsRecord = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<List<PlayersRecord>>(
                        stream: queryPlayersRecord(
                          parent: widget.roomdetails,
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<PlayersRecord> containerPlayersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerPlayersRecord =
                              containerPlayersRecordList.isNotEmpty
                                  ? containerPlayersRecordList.first
                                  : null;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Q ${columnRoomsRecord.round?.toString()}:',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                          ),
                                    ),
                                    FlutterFlowTimer(
                                      initialTime: _model.timerMilliseconds,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                      ),
                                      timer: _model.timerController,
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timerMilliseconds = value;
                                        _model.timerValue = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                          ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                            ),
                                      ),
                                    ),
                                    Switch(
                                      value: _model.switchValue ??= false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.switchValue = newValue!);
                                        if (newValue!) {
                                          _model.timerController.onExecute
                                              .add(StopWatchExecute.start);
                                        }
                                      },
                                    ),
                                    Text(
                                      '${columnRoomsRecord.joinedPlayers?.toString()}/${columnRoomsRecord.numOfPlayers?.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          50, 0, 0, 0),
                                      child: LinearPercentIndicator(
                                        percent: functions.progressBar(
                                            FFAppState().round,
                                            columnRoomsRecord.winCondition!),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        lineHeight: 30,
                                        animation: false,
                                        progressColor: Color(0xFF03FF00),
                                        backgroundColor: Colors.white,
                                        center: Text(
                                          '${FFAppState().round.toString()}/${columnRoomsRecord.winCondition?.toString()}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                              ),
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.currentQController,
                                readOnly: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: functions.getCurrentQuestion(
                                      columnRoomsRecord.questionList!.toList(),
                                      FFAppState().round),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 50,
                                      ),
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
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 40,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model.currentQControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Text(
                              ' = ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _model.userAnswerTextController,
                                onFieldSubmitted: (_) async {
                                  if ((functions.questionSolver(
                                              _model.currentQController.text) ==
                                          _model
                                              .userAnswerTextController.text) ||
                                      (functions.questionSolver(
                                              _model.currentQController.text) ==
                                          FFAppState().userAnswer)) {
                                    _model.timerController.onExecute
                                        .add(StopWatchExecute.stop);
                                    FFAppState().update(() {
                                      FFAppState().multiplayerscore =
                                          functions.calculateNewScore(
                                              FFAppState().multiplayerscore,
                                              _model.timerMilliseconds);
                                    });
                                  } else {
                                    FFAppState().update(() {
                                      FFAppState().userAnswer = '';
                                    });
                                    setState(() {
                                      _model.userAnswerTextController?.clear();
                                    });
                                    return;
                                  }

                                  FFAppState().update(() {
                                    FFAppState().round = FFAppState().round + 1;
                                  });
                                  _model.timerController.onExecute
                                      .add(StopWatchExecute.reset);

                                  FFAppState().update(() {
                                    FFAppState().userAnswer = '';
                                  });
                                  setState(() {
                                    _model.userAnswerTextController?.clear();
                                  });
                                  if (FFAppState().round ==
                                      columnRoomsRecord.winCondition) {
                                    _model.timerController.onExecute
                                        .add(StopWatchExecute.stop);
                                    FFAppState().update(() {
                                      FFAppState().multiplayerscore = 0;
                                    });
                                  } else {
                                    return;
                                  }
                                },
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFAppState().userAnswer,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 50,
                                      ),
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
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 40,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .userAnswerTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: GridView(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.7,
                          ),
                          scrollDirection: Axis.vertical,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '1');
                                });
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
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '2');
                                });
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
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '3');
                                });
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
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '4');
                                });
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
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '5');
                                });
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
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '6');
                                });
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
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '7');
                                });
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
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '8');
                                });
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
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '9');
                                });
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
                                color:
                                    FlutterFlowTheme.of(context).customColor3,
                                size: 30,
                              ),
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().userAnswer = '';
                                });
                                setState(() {
                                  _model.userAnswerTextController?.clear();
                                });
                              },
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().userAnswer =
                                      functions.updateAnswer(
                                          FFAppState().userAnswer, '0');
                                });
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
                                if ((functions.questionSolver(
                                            FFAppState().currentQuestion) ==
                                        _model.userAnswerTextController.text) ||
                                    (functions.questionSolver(
                                            FFAppState().currentQuestion) ==
                                        FFAppState().userAnswer)) {
                                  FFAppState().update(() {
                                    FFAppState().trialScore =
                                        FFAppState().trialScore + 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().userAnswer = '';
                                  });
                                  setState(() {
                                    _model.userAnswerTextController?.clear();
                                  });
                                  return;
                                }

                                FFAppState().update(() {
                                  FFAppState().currentQuestion =
                                      functions.generateRandomQuestion(
                                          widget.levelDifficulty!);
                                  FFAppState().userAnswer = '';
                                });
                                setState(() {
                                  _model.userAnswerTextController?.clear();
                                });
                                if (FFAppState().trialScore == 10) {
                                  _model.timerController.onExecute
                                      .add(StopWatchExecute.stop);
                                  FFAppState().update(() {
                                    FFAppState().trialScore = 0;
                                  });
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EndgameWidget(
                                        isDaily: false,
                                        ttDiff: widget.levelDifficulty,
                                      ),
                                    ),
                                  );
                                } else {
                                  return;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
