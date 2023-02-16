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

class CreateGameSettingsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DifficultyChoiceChips widget.
  String? difficultyChoiceChipsValue;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RoomsRecord? roomDetails;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PlayersRecord? hostDoc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
