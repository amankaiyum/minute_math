import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_before_game_delete_model.dart';
export 'popup_before_game_delete_model.dart';

class PopupBeforeGameDeleteWidget extends StatefulWidget {
  const PopupBeforeGameDeleteWidget({Key? key}) : super(key: key);

  @override
  _PopupBeforeGameDeleteWidgetState createState() =>
      _PopupBeforeGameDeleteWidgetState();
}

class _PopupBeforeGameDeleteWidgetState
    extends State<PopupBeforeGameDeleteWidget> {
  late PopupBeforeGameDeleteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupBeforeGameDeleteModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
      child: InkWell(
        onTap: () async {
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('Easy'),
                    content: Text(
                        'How to Play: 60 seconds to answer as many questions as possible '),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: Text('Confirm'),
                      ),
                    ],
                  );
                },
              ) ??
              false;
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x411D2429),
                offset: Offset(0, -2),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Text(
                'Easy',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
