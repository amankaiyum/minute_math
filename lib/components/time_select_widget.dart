import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../daily_set/daily_set_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_select_model.dart';
export 'time_select_model.dart';

class TimeSelectWidget extends StatefulWidget {
  const TimeSelectWidget({Key? key}) : super(key: key);

  @override
  _TimeSelectWidgetState createState() => _TimeSelectWidgetState();
}

class _TimeSelectWidgetState extends State<TimeSelectWidget> {
  late TimeSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeSelectModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<DailySetRecord>>(
      stream: queryDailySetRecord(
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
        List<DailySetRecord> bottomSheetMaterialDailySetRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final bottomSheetMaterialDailySetRecord =
            bottomSheetMaterialDailySetRecordList.isNotEmpty
                ? bottomSheetMaterialDailySetRecordList.first
                : null;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: Text(
                    'Select Duration',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (!FFAppState().dsCompleted) {
                            if (getCurrentTimestamp >
                                bottomSheetMaterialDailySetRecord!.resetTime!) {
                              _model.dailySet = await actions.createQuestionSet(
                                60,
                                'Medium',
                              );

                              final dailySetUpdateData = {
                                ...createDailySetRecordData(
                                  resetTime: functions.setResetTime(),
                                  lastUpdated: getCurrentTimestamp,
                                ),
                                'dailySet': _model.dailySet,
                              };
                              await bottomSheetMaterialDailySetRecord!.reference
                                  .update(dailySetUpdateData);
                              FFAppState().update(() {
                                FFAppState().dsCompleted = true;
                                FFAppState().dsResetTime =
                                    functions.setResetTime();
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DailySetWidget(
                                    timerStart: 60000,
                                    dailyset: _model.dailySet?.toList(),
                                  ),
                                ),
                              );
                            } else {
                              FFAppState().update(() {
                                FFAppState().currentQuestion =
                                    functions.getCurrentQuestion(
                                        bottomSheetMaterialDailySetRecord!
                                            .dailySet!
                                            .toList(),
                                        FFAppState().currQuestion);
                                FFAppState().dsCompleted = true;
                                FFAppState().dsResetTime =
                                    functions.setResetTime();
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DailySetWidget(
                                    timerStart: 60000,
                                    dailyset: bottomSheetMaterialDailySetRecord!
                                        .dailySet!
                                        .toList(),
                                  ),
                                ),
                              );
                            }
                          }

                          setState(() {});
                        },
                        text: !FFAppState().dsCompleted
                            ? '60 Seconds'
                            : 'Play again after: ${dateTimeFormat('jm', FFAppState().dsResetTime)}',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (!FFAppState().ds30sCompleted) {
                            if (getCurrentTimestamp >
                                bottomSheetMaterialDailySetRecord!
                                    .resetTime30s!) {
                              _model.dailySet30s =
                                  await actions.createQuestionSet(
                                60,
                                'Medium',
                              );

                              final dailySetUpdateData = {
                                ...createDailySetRecordData(
                                  lastUpdated: getCurrentTimestamp,
                                  resetTime30s: functions.setResetTime(),
                                ),
                                'dailySet30s': _model.dailySet30s,
                              };
                              await bottomSheetMaterialDailySetRecord!.reference
                                  .update(dailySetUpdateData);
                              FFAppState().update(() {
                                FFAppState().ds30sCompleted = true;
                                FFAppState().ds30sResetTime =
                                    functions.setResetTime();
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DailySetWidget(
                                    timerStart: 30000,
                                    dailyset: _model.dailySet30s?.toList(),
                                  ),
                                ),
                              );
                            } else {
                              FFAppState().update(() {
                                FFAppState().currentQuestion =
                                    functions.getCurrentQuestion(
                                        bottomSheetMaterialDailySetRecord!
                                            .dailySet30s!
                                            .toList(),
                                        FFAppState().currQuestion);
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DailySetWidget(
                                    timerStart: 30000,
                                    dailyset: bottomSheetMaterialDailySetRecord!
                                        .dailySet30s!
                                        .toList(),
                                  ),
                                ),
                              );
                            }
                          }

                          setState(() {});
                        },
                        text: !FFAppState().ds30sCompleted
                            ? '30 Seconds'
                            : 'Play again after: ${dateTimeFormat('jm', FFAppState().ds30sResetTime)}',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (!FFAppState().ds15sCompleted) {
                            if (getCurrentTimestamp >
                                bottomSheetMaterialDailySetRecord!
                                    .resetTime15s!) {
                              _model.dailySet15s =
                                  await actions.createQuestionSet(
                                60,
                                'Medium',
                              );

                              final dailySetUpdateData = {
                                ...createDailySetRecordData(
                                  resetTime: functions.setResetTime(),
                                  lastUpdated: getCurrentTimestamp,
                                ),
                                'dailySet15s': _model.dailySet15s,
                              };
                              await bottomSheetMaterialDailySetRecord!.reference
                                  .update(dailySetUpdateData);
                              FFAppState().update(() {
                                FFAppState().ds15sResetTime =
                                    functions.setResetTime();
                                FFAppState().ds15sCompleted = true;
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DailySetWidget(
                                    timerStart: 15000,
                                    dailyset: _model.dailySet15s?.toList(),
                                  ),
                                ),
                              );
                            } else {
                              FFAppState().update(() {
                                FFAppState().currentQuestion =
                                    functions.getCurrentQuestion(
                                        bottomSheetMaterialDailySetRecord!
                                            .dailySet15s!
                                            .toList(),
                                        FFAppState().currQuestion);
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DailySetWidget(
                                    timerStart: 15000,
                                    dailyset: bottomSheetMaterialDailySetRecord!
                                        .dailySet15s!
                                        .toList(),
                                  ),
                                ),
                              );
                            }
                          }

                          setState(() {});
                        },
                        text: !FFAppState().ds15sCompleted
                            ? '15 Seconds'
                            : 'Play again after: ${dateTimeFormat('jm', FFAppState().ds15sResetTime)}',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
