import '../endgame/endgame_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'daily_set_model.dart';
export 'daily_set_model.dart';

class DailySetWidget extends StatefulWidget {
  const DailySetWidget({
    Key? key,
    this.timerStart,
    this.dailyset,
  }) : super(key: key);

  final int? timerStart;
  final List<String>? dailyset;

  @override
  _DailySetWidgetState createState() => _DailySetWidgetState();
}

class _DailySetWidgetState extends State<DailySetWidget> {
  late DailySetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DailySetModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onExecute.add(StopWatchExecute.start);
      FFAppState().update(() {
        FFAppState().currentQuestion = functions.getCurrentQuestion(
            widget.dailyset!.toList(), FFAppState().currQuestion);
      });
    });

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
              FFAppState().currentScore = 0;
              FFAppState().currentQuestion = '';
            });
            FFAppState().update(() {
              FFAppState().userAnswer = '';
            });
            FFAppState().update(() {
              FFAppState().currQuestion = 0;
            });
            _model.timerController.onExecute.add(StopWatchExecute.stop);
          },
        ),
        title: Text(
          'Minute Math',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FlutterFlowTimer(
                        initialTime: widget.timerStart!,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        timer: _model.timerController,
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) setState(() {});
                        },
                        onEnded: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EndgameWidget(
                                score: FFAppState().currentScore,
                                isDaily: true,
                                time: 0,
                                dailySetMode: widget.timerStart,
                              ),
                            ),
                          );
                        },
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    Text(
                      's',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            FFAppState().currentScore.toString(),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFAppState().currentQuestion,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 50,
                          ),
                    ),
                    Text(
                      ' = ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 50,
                          ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _model.userAnswerTextController,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.userAnswerTextController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        onFieldSubmitted: (_) async {
                          if ((functions.questionSolver(
                                      FFAppState().currentQuestion) ==
                                  FFAppState().userAnswer) ||
                              (functions.questionSolver(
                                      FFAppState().currentQuestion) ==
                                  _model.userAnswerTextController.text)) {
                            FFAppState().update(() {
                              FFAppState().currentScore =
                                  FFAppState().currentScore + 1;
                            });
                          } else {
                            FFAppState().update(() {
                              FFAppState().currentScore =
                                  FFAppState().currentScore + -1;
                            });
                          }

                          FFAppState().update(() {
                            FFAppState().currQuestion =
                                FFAppState().currQuestion + 1;
                          });
                          FFAppState().update(() {
                            FFAppState().currentQuestion =
                                functions.getCurrentQuestion(
                                    widget.dailyset!.toList(),
                                    FFAppState().currQuestion);
                            FFAppState().userAnswer = '';
                          });
                          setState(() {
                            _model.userAnswerTextController?.clear();
                          });
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
                          suffixIcon: _model
                                  .userAnswerTextController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.userAnswerTextController?.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 50,
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
                        setState(() {
                          _model.userAnswerTextController?.clear();
                        });
                        FFAppState().update(() {
                          FFAppState().userAnswer = '';
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
                                FFAppState().userAnswer) ||
                            (functions.questionSolver(
                                    FFAppState().currentQuestion) ==
                                _model.userAnswerTextController.text)) {
                          FFAppState().update(() {
                            FFAppState().currentScore =
                                FFAppState().currentScore + 1;
                          });
                        } else {
                          FFAppState().update(() {
                            FFAppState().currentScore =
                                FFAppState().currentScore + -1;
                          });
                        }

                        FFAppState().update(() {
                          FFAppState().currQuestion =
                              FFAppState().currQuestion + 1;
                        });
                        FFAppState().update(() {
                          FFAppState().currentQuestion =
                              functions.getCurrentQuestion(
                                  widget.dailyset!.toList(),
                                  FFAppState().currQuestion);
                          FFAppState().userAnswer = '';
                        });
                        setState(() {
                          _model.userAnswerTextController?.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
