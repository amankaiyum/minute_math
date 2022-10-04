import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class TestpageWidget extends StatefulWidget {
  const TestpageWidget({Key? key}) : super(key: key);

  @override
  _TestpageWidgetState createState() => _TestpageWidgetState();
}

class _TestpageWidgetState extends State<TestpageWidget> {
  StopWatchTimer? timerController;
  String? timerValue;
  int? timerMilliseconds;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      timerController?.onExecute.add(
        StopWatchExecute.start,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    timerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Slidable(
                actionPane: const SlidableScrollActionPane(),
                secondaryActions: [
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.blue,
                    icon: Icons.share,
                    onTap: () {
                      print('SlidableActionWidget pressed ...');
                    },
                  ),
                ],
                child: ListTile(
                  title: Text(
                    'Time Trial Easy',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                  subtitle: Text(
                    'Fastest Time',
                    style: FlutterFlowTheme.of(context).subtitle2,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
              FlutterFlowTimer(
                onInit: () {
                  timerMilliseconds ??= 0;
                  timerValue ??= StopWatchTimer.getDisplayTime(
                    0,
                    hours: false,
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
                          hours: false,
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
                      hours: false,
                      minute: true,
                      second: true,
                      milliSecond: false,
                    ),
                timer: timerController ?? StopWatchTimer(),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryColor,
                      fontSize: 50,
                    ),
                onEnded: () async {
                  setState(() =>
                      FFAppState().trialScore = FFAppState().trialScore + 1);
                },
              ),
              FFButtonWidget(
                onPressed: () async {
                  timerController?.onExecute.add(
                    StopWatchExecute.stop,
                  );
                },
                text: 'Button',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  timerController?.onExecute.add(
                    StopWatchExecute.start,
                  );
                },
                text: 'Button',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  setState(() =>
                      FFAppState().trialScore = FFAppState().trialScore + -1);
                },
                text: 'Button',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Text(
                FFAppState().trialScore.toString(),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
