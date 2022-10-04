import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NumPadWidget extends StatefulWidget {
  const NumPadWidget({Key? key}) : super(key: key);

  @override
  _NumPadWidgetState createState() => _NumPadWidgetState();
}

class _NumPadWidgetState extends State<NumPadWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView(
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
          onPressed: () {
            print('Button pressed ...');
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
          onPressed: () {
            print('Button pressed ...');
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
          onPressed: () {
            print('Button pressed ...');
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
          onPressed: () {
            print('Button pressed ...');
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
          onPressed: () {
            print('IconButton pressed ...');
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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
      ],
    );
  }
}
