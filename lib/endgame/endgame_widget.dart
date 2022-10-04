import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../start_page/start_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EndgameWidget extends StatefulWidget {
  const EndgameWidget({
    Key? key,
    this.time,
    this.score,
    this.isDaily,
  }) : super(key: key);

  final String? time;
  final int? score;
  final bool? isDaily;

  @override
  _EndgameWidgetState createState() => _EndgameWidgetState();
}

class _EndgameWidgetState extends State<EndgameWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
              final columnUsersRecord = snapshot.data!;
              return Column(
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
                    widget.isDaily! ? 'Your Score was :' : 'Your Time was',
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
                            widget.isDaily!
                                ? widget.score!.toString()
                                : widget.time!,
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
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
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final buttonUsersRecord = snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            setState(() => FFAppState().currentScore = 0);
                            setState(() => FFAppState().userAnswer = '');
                            if (widget.isDaily!) {
                              final usersUpdateData = createUsersRecordData(
                                dailyScore: widget.score,
                              );
                              await buttonUsersRecord.reference
                                  .update(usersUpdateData);
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
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
