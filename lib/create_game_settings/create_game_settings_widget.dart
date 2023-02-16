import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../pregame_page/pregame_page_widget.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_game_settings_model.dart';
export 'create_game_settings_model.dart';

class CreateGameSettingsWidget extends StatefulWidget {
  const CreateGameSettingsWidget({Key? key}) : super(key: key);

  @override
  _CreateGameSettingsWidgetState createState() =>
      _CreateGameSettingsWidgetState();
}

class _CreateGameSettingsWidgetState extends State<CreateGameSettingsWidget> {
  late CreateGameSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateGameSettingsModel());
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
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Game Config',
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/page_background@2x.png',
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).customColor5,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 54, 24, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Text(
                          'New Game',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Select Dificulties',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ),
                      FlutterFlowChoiceChips(
                        initiallySelected: ['Easy'],
                        options: [
                          ChipData('Easy'),
                          ChipData('Medium'),
                          ChipData('Hard'),
                          ChipData('Hell')
                        ],
                        onChanged: (val) => setState(() =>
                            _model.difficultyChoiceChipsValue = val?.first),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF323B45),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          iconColor: Colors.white,
                          iconSize: 18,
                          elevation: 4,
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF323B45),
                                  ),
                          iconColor: Color(0xFF323B45),
                          iconSize: 18,
                          elevation: 4,
                        ),
                        chipSpacing: 20,
                        multiselect: false,
                        initialized: _model.difficultyChoiceChipsValue != null,
                        alignment: WrapAlignment.start,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Select Win Condition - 1st to :',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xFF9E9E9E),
                            width: 1,
                          ),
                        ),
                        child: FlutterFlowCountController(
                          decrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.minus,
                            color:
                                enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                            size: 20,
                          ),
                          incrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.plus,
                            color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                            size: 20,
                          ),
                          countBuilder: (count) => Text(
                            count.toString(),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          count: _model.countControllerValue1 ??= 3,
                          updateCount: (count) => setState(
                              () => _model.countControllerValue1 = count),
                          stepSize: 1,
                          minimum: 3,
                          maximum: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Time limit  per question (s)',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xFF9E9E9E),
                            width: 1,
                          ),
                        ),
                        child: FlutterFlowCountController(
                          decrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.minus,
                            color:
                                enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                            size: 20,
                          ),
                          incrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.plus,
                            color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                            size: 20,
                          ),
                          countBuilder: (count) => Text(
                            count.toString(),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          count: _model.countControllerValue2 ??= 60,
                          updateCount: (count) => setState(
                              () => _model.countControllerValue2 = count),
                          stepSize: 5,
                          minimum: 5,
                          maximum: 60,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Select Mode',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ),
                      FlutterFlowChoiceChips(
                        initiallySelected: ['Free For All'],
                        options: [ChipData('Free For All'), ChipData('Teams')],
                        onChanged: (val) => setState(
                            () => _model.choiceChipsValue = val?.first),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF323B45),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          iconColor: Colors.white,
                          iconSize: 18,
                          elevation: 4,
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF323B45),
                                  ),
                          iconColor: Color(0xFF323B45),
                          iconSize: 18,
                          elevation: 4,
                        ),
                        chipSpacing: 20,
                        multiselect: false,
                        initialized: _model.choiceChipsValue != null,
                        alignment: WrapAlignment.start,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final roomsCreateData = createRoomsRecordData(
                              code: random_data.randomString(
                                6,
                                6,
                                true,
                                true,
                                false,
                              ),
                              host: currentUserDisplayName,
                              isStarted: false,
                              winCondition: _model.countControllerValue1,
                              difficulty: _model.difficultyChoiceChipsValue,
                              timer: _model.countControllerValue2,
                              round: 0,
                              everyoneJoined: false,
                              numOfPlayers: 1,
                            );
                            var roomsRecordReference =
                                RoomsRecord.collection.doc();
                            await roomsRecordReference.set(roomsCreateData);
                            _model.roomDetails =
                                RoomsRecord.getDocumentFromData(
                                    roomsCreateData, roomsRecordReference);

                            final playersCreateData = createPlayersRecordData(
                              uid: currentUserUid,
                              name: currentUserDisplayName,
                              isTeamSelected: false,
                              isBlack: false,
                              score: 0,
                              isHost: true,
                            );
                            var playersRecordReference =
                                PlayersRecord.createDoc(
                                    _model.roomDetails!.reference);
                            await playersRecordReference.set(playersCreateData);
                            _model.hostDoc = PlayersRecord.getDocumentFromData(
                                playersCreateData, playersRecordReference);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PregamePageWidget(
                                  roomDetails: _model.roomDetails!.reference,
                                  playerdoc: _model.hostDoc!.reference,
                                ),
                              ),
                            );

                            setState(() {});
                          },
                          text: 'Create Game',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 70,
                            color: FlutterFlowTheme.of(context).customColor4,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                            elevation: 4,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
