import '../components/t_t_difficulty_select_widget.dart';
import '../components/time_select_widget.dart';
import '../create_join_game/create_join_game_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../leaderboards/leaderboards_widget.dart';
import '../leaderboards_copy/leaderboards_copy_widget.dart';
import '../profilepage/profilepage_widget.dart';
import '../stats_page/stats_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'start_page_model.dart';
export 'start_page_model.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({Key? key}) : super(key: key);

  @override
  _StartPageWidgetState createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget>
    with TickerProviderStateMixin {
  late StartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasImageTriggered = false;
  final animationsMap = {
    'imageOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.75,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (getCurrentTimestamp > FFAppState().dsResetTime!) {
        FFAppState().update(() {
          FFAppState().dsCompleted = false;
        });
      } else {
        FFAppState().update(() {
          FFAppState().dsCompleted = true;
        });
      }

      if (getCurrentTimestamp > FFAppState().ds30sResetTime!) {
        FFAppState().update(() {
          FFAppState().ds30sCompleted = false;
        });
      } else {
        FFAppState().update(() {
          FFAppState().ds30sCompleted = true;
        });
      }

      if (getCurrentTimestamp > FFAppState().ds15sResetTime!) {
        FFAppState().update(() {
          FFAppState().ds15sCompleted = false;
        });
      } else {
        FFAppState().update(() {
          FFAppState().ds15sCompleted = true;
        });
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(0, 0.05),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Text(
              'Minute Math',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Special Elite',
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                  '',
                ).image,
              ),
              gradient: LinearGradient(
                colors: [Color(0xFF253541), Colors.black],
                stops: [0, 1],
                begin: AlignmentDirectional(1, 0),
                end: AlignmentDirectional(-1, 0),
              ),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: TimeSelectWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    text: 'Daily Set',
                    icon: FaIcon(
                      FontAwesomeIcons.angleDoubleRight,
                    ),
                    options: FFButtonOptions(
                      width: 200,
                      height: 40,
                      color: Colors.white,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle1.override(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: TTDifficultySelectWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    text: 'Time Trial',
                    icon: Icon(
                      Icons.timer,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 200,
                      height: 40,
                      color: Colors.white,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle1.override(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: InkWell(
                    onDoubleTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LeaderboardsCopyWidget(),
                        ),
                      );
                    },
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeaderboardsWidget(),
                          ),
                        );
                      },
                      text: 'Leaderboards',
                      icon: Icon(
                        Icons.leaderboard,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 40,
                        color: Colors.white,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle1.override(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StatsPageWidget(),
                        ),
                      );
                    },
                    text: 'Personal Stats',
                    icon: Icon(
                      Icons.stacked_line_chart_rounded,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 200,
                      height: 40,
                      color: Colors.white,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle1.override(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilepageWidget(),
                        ),
                      );
                    },
                    text: 'Profile',
                    icon: Icon(
                      Icons.person,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 200,
                      height: 40,
                      color: Colors.white,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle1.override(
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
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateJoinGameWidget(),
                      ),
                    );
                  },
                  text: 'Duel',
                  icon: Icon(
                    Icons.sync_alt_sharp,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 200,
                    height: 40,
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).subtitle1.override(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      if (animationsMap['imageOnActionTriggerAnimation'] !=
                          null) {
                        setState(() => hasImageTriggered = true);
                        SchedulerBinding.instance.addPostFrameCallback(
                            (_) async =>
                                animationsMap['imageOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0));
                      }
                    },
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/801/801755.png',
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ).animateOnActionTrigger(
                      animationsMap['imageOnActionTriggerAnimation']!,
                      hasBeenTriggered: hasImageTriggered),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
