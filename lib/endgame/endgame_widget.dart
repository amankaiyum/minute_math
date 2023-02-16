import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../start_page/start_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'endgame_model.dart';
export 'endgame_model.dart';

class EndgameWidget extends StatefulWidget {
  const EndgameWidget({
    Key? key,
    this.time,
    this.score,
    this.isDaily,
    this.ttDiff,
    this.dailySetMode,
  }) : super(key: key);

  final int? time;
  final int? score;
  final bool? isDaily;
  final String? ttDiff;
  final int? dailySetMode;

  @override
  _EndgameWidgetState createState() => _EndgameWidgetState();
}

class _EndgameWidgetState extends State<EndgameWidget> {
  late EndgameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EndgameModel());
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_xlkxtmul.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      frameRate: FrameRate(60),
                      repeat: false,
                      animate: true,
                    ),
                  ],
                ),
              ),
              Text(
                'Congrats!',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 32,
                    ),
              ),
              Text(
                widget.isDaily!
                    ? 'Your Score was :'
                    : '${widget.ttDiff} - Time was :',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 32,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.isDaily!
                              ? widget.score?.toString()
                              : functions.msToS(widget.time!).toString(),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 40,
                            ),
                      ),
                    ),
                  ),
                  if (!widget.isDaily!)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 12, 0, 0),
                      child: Text(
                        's',
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 40,
                            ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(currentUserReference!),
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
                    final buttonUsersRecord = snapshot.data!;
                    return FFButtonWidget(
                      onPressed: () async {
                        FFAppState().update(() {
                          FFAppState().currentScore = 0;
                          FFAppState().userAnswer = '';
                          FFAppState().currQuestion = 0;
                        });
                        FFAppState().update(() {
                          FFAppState().currentQuestion = '';
                        });
                        if (widget.isDaily!) {
                          if (widget.dailySetMode == 60000) {
                            final usersUpdateData1 = {
                              ...createUsersRecordData(
                                dailyScore: widget.score,
                                avgDailyScore:
                                    functions.calculateNewAverageDailyScore(
                                        buttonUsersRecord.avgDailyScore!,
                                        buttonUsersRecord.daysPlayed!,
                                        widget.score!),
                                bestScore:
                                    widget.score! > buttonUsersRecord.bestScore!
                                        ? widget.score
                                        : buttonUsersRecord.bestScore,
                              ),
                              'days_played': FieldValue.increment(1),
                            };
                            await buttonUsersRecord.reference
                                .update(usersUpdateData1);
                            FFAppState().update(() {
                              FFAppState().dsCompleted = true;
                              FFAppState().dsResetTime =
                                  functions.setResetTime();
                            });
                          } else {
                            if (widget.dailySetMode == 30000) {
                              final usersUpdateData2 = {
                                ...createUsersRecordData(
                                  ds30sScore: widget.score,
                                  ds30sAvg:
                                      functions.calculateNewAverageDailyScore(
                                          buttonUsersRecord.ds30sAvg!,
                                          buttonUsersRecord.ds30sDp!,
                                          widget.score!),
                                  ds30sBest: widget.score! >
                                          buttonUsersRecord.ds30sBest!
                                      ? widget.score
                                      : buttonUsersRecord.ds30sBest,
                                ),
                                'ds_30s_dp': FieldValue.increment(1),
                              };
                              await buttonUsersRecord.reference
                                  .update(usersUpdateData2);
                              FFAppState().update(() {
                                FFAppState().ds30sCompleted = true;
                                FFAppState().ds30sResetTime =
                                    functions.setResetTime();
                              });
                            } else {
                              final usersUpdateData3 = {
                                ...createUsersRecordData(
                                  ds15sScore: widget.score,
                                  ds15sAvg:
                                      functions.calculateNewAverageDailyScore(
                                          buttonUsersRecord.ds15sAvg!,
                                          buttonUsersRecord.ds15sDp!,
                                          widget.score!),
                                  ds15sBest: widget.score! >
                                          buttonUsersRecord.ds15sBest!
                                      ? widget.score
                                      : buttonUsersRecord.ds15sBest,
                                ),
                                'ds_15s_dp': FieldValue.increment(1),
                              };
                              await buttonUsersRecord.reference
                                  .update(usersUpdateData3);
                              FFAppState().update(() {
                                FFAppState().ds15sResetTime =
                                    functions.setResetTime();
                                FFAppState().ds15sCompleted = true;
                              });
                            }
                          }
                        } else {
                          if (widget.ttDiff == 'Easy') {
                            if (buttonUsersRecord.tTEasy == 0) {
                              final usersUpdateData4 = createUsersRecordData(
                                tTEasy: widget.time,
                              );
                              await buttonUsersRecord.reference
                                  .update(usersUpdateData4);
                            } else {
                              if (widget.time! < buttonUsersRecord.tTEasy!) {
                                final usersUpdateData5 = createUsersRecordData(
                                  tTEasy: widget.time,
                                );
                                await buttonUsersRecord.reference
                                    .update(usersUpdateData5);
                              }
                            }
                          } else {
                            if (widget.ttDiff == 'Medium') {
                              if (buttonUsersRecord.tTMedium == 0) {
                                final usersUpdateData6 = createUsersRecordData(
                                  tTMedium: widget.time,
                                );
                                await buttonUsersRecord.reference
                                    .update(usersUpdateData6);
                              } else {
                                if (widget.time! <
                                    buttonUsersRecord.tTMedium!) {
                                  final usersUpdateData7 =
                                      createUsersRecordData(
                                    tTMedium: widget.time,
                                  );
                                  await buttonUsersRecord.reference
                                      .update(usersUpdateData7);
                                }
                              }
                            } else {
                              if (widget.ttDiff == 'Hard') {
                                if (buttonUsersRecord.tTHard == 0) {
                                  final usersUpdateData8 =
                                      createUsersRecordData(
                                    tTHard: widget.time,
                                  );
                                  await buttonUsersRecord.reference
                                      .update(usersUpdateData8);
                                } else {
                                  if (widget.time! <
                                      buttonUsersRecord.tTHard!) {
                                    final usersUpdateData9 =
                                        createUsersRecordData(
                                      tTHard: widget.time,
                                    );
                                    await buttonUsersRecord.reference
                                        .update(usersUpdateData9);
                                  }
                                }
                              } else {
                                if (buttonUsersRecord.tTHell == 0) {
                                  final usersUpdateData10 =
                                      createUsersRecordData(
                                    tTHell: widget.time,
                                  );
                                  await buttonUsersRecord.reference
                                      .update(usersUpdateData10);
                                } else {
                                  if (widget.time! <
                                      buttonUsersRecord.tTHell!) {
                                    final usersUpdateData11 =
                                        createUsersRecordData(
                                      tTHell: widget.time,
                                    );
                                    await buttonUsersRecord.reference
                                        .update(usersUpdateData11);
                                  }
                                }
                              }
                            }
                          }
                        }

                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StartPageWidget(),
                          ),
                        );
                      },
                      text: 'Go Home',
                      options: FFButtonOptions(
                        width: 130,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
