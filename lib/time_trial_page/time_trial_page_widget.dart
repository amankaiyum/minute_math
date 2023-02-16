import '../endgame/endgame_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'time_trial_page_model.dart';
export 'time_trial_page_model.dart';

class TimeTrialPageWidget extends StatefulWidget {
  const TimeTrialPageWidget({
    Key? key,
    this.levelDifficulty,
  }) : super(key: key);

  final String? levelDifficulty;

  @override
  _TimeTrialPageWidgetState createState() => _TimeTrialPageWidgetState();
}

class _TimeTrialPageWidgetState extends State<TimeTrialPageWidget>
    with TickerProviderStateMixin {
  late TimeTrialPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 3600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeTrialPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (animationsMap['columnOnActionTriggerAnimation'] != null) {
        await animationsMap['columnOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      _model.timerController.onExecute.add(StopWatchExecute.start);
      FFAppState().update(() {
        FFAppState().currentQuestion =
            functions.generateRandomQuestion(widget.levelDifficulty!);
      });
    });

    _model.userAnswerTextController = TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
          'Minute Math : ${widget.levelDifficulty}',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: FlutterFlowTimer(
                        initialTime: _model.timerMilliseconds,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                        ),
                        timer: _model.timerController,
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) setState(() {});
                        },
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        's',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                      child: LinearPercentIndicator(
                        percent:
                            functions.progressBar(FFAppState().trialScore, 10),
                        width: MediaQuery.of(context).size.width * 0.3,
                        lineHeight: 30,
                        animation: false,
                        progressColor: Color(0xFF03FF00),
                        backgroundColor: Colors.white,
                        center: Text(
                          '${FFAppState().trialScore.toString()}/10',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      FFAppState().currentQuestion,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 40,
                          ),
                    ),
                    Text(
                      ' = ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                  time: _model.timerMilliseconds,
                                  isDaily: false,
                                  ttDiff: widget.levelDifficulty,
                                ),
                              ),
                            );
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
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
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
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 40,
                            ),
                        keyboardType: TextInputType.number,
                        validator: _model.userAnswerTextControllerValidator
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
                        FFAppState().update(() {
                          FFAppState().userAnswer = functions.updateAnswer(
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
                          FFAppState().userAnswer = functions.updateAnswer(
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
                          FFAppState().userAnswer = functions.updateAnswer(
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
                          FFAppState().userAnswer = functions.updateAnswer(
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
                          FFAppState().userAnswer = functions.updateAnswer(
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
                          FFAppState().userAnswer = functions.updateAnswer(
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
                          FFAppState().userAnswer = functions.updateAnswer(
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
                          FFAppState().userAnswer = functions.updateAnswer(
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
                          FFAppState().userAnswer = functions.updateAnswer(
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
                        color: FlutterFlowTheme.of(context).customColor3,
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
                          FFAppState().userAnswer = functions.updateAnswer(
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
                          FFAppState().currentQuestion = functions
                              .generateRandomQuestion(widget.levelDifficulty!);
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
                                time: _model.timerMilliseconds,
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
          ).animateOnActionTrigger(
            animationsMap['columnOnActionTriggerAnimation']!,
          ),
        ),
      ),
    );
  }
}
