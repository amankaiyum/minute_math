import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../pregame_page/pregame_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'online_rooms_pages_model.dart';
export 'online_rooms_pages_model.dart';

class OnlineRoomsPagesWidget extends StatefulWidget {
  const OnlineRoomsPagesWidget({Key? key}) : super(key: key);

  @override
  _OnlineRoomsPagesWidgetState createState() => _OnlineRoomsPagesWidgetState();
}

class _OnlineRoomsPagesWidgetState extends State<OnlineRoomsPagesWidget> {
  late OnlineRoomsPagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnlineRoomsPagesModel());
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
      backgroundColor: Colors.white,
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
          },
        ),
        title: Text(
          'Lobbies',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Hello World',
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                    Icon(
                      Icons.refresh,
                      color: Colors.black,
                      size: 24,
                    ),
                  ],
                ),
              ),
              PagedListView<DocumentSnapshot<Object?>?, RoomsRecord>(
                pagingController: () {
                  final Query<Object?> Function(Query<Object?>) queryBuilder =
                      (roomsRecord) => roomsRecord;
                  if (_model.pagingController != null) {
                    final query = queryBuilder(RoomsRecord.collection);
                    if (query != _model.pagingQuery) {
                      // The query has changed
                      _model.pagingQuery = query;
                      _model.streamSubscriptions.forEach((s) => s?.cancel());
                      _model.streamSubscriptions.clear();
                      _model.pagingController!.refresh();
                    }
                    return _model.pagingController!;
                  }

                  _model.pagingController =
                      PagingController(firstPageKey: null);
                  _model.pagingQuery = queryBuilder(RoomsRecord.collection);
                  _model.pagingController!
                      .addPageRequestListener((nextPageMarker) {
                    queryRoomsRecordPage(
                      queryBuilder: (roomsRecord) => roomsRecord,
                      nextPageMarker: nextPageMarker,
                      pageSize: 25,
                      isStream: true,
                    ).then((page) {
                      _model.pagingController!.appendPage(
                        page.data,
                        page.nextPageMarker,
                      );
                      final streamSubscription =
                          page.dataStream?.listen((data) {
                        data.forEach((item) {
                          final itemIndexes = _model.pagingController!.itemList!
                              .asMap()
                              .map((k, v) => MapEntry(v.reference.id, k));
                          final index = itemIndexes[item.reference.id];
                          final items = _model.pagingController!.itemList!;
                          if (index != null) {
                            items.replaceRange(index, index + 1, [item]);
                            _model.pagingController!.itemList = {
                              for (var item in items) item.reference: item
                            }.values.toList();
                          }
                        });
                        setState(() {});
                      });
                      _model.streamSubscriptions.add(streamSubscription);
                    });
                  });
                  return _model.pagingController!;
                }(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                builderDelegate: PagedChildBuilderDelegate<RoomsRecord>(
                  // Customize what your widget looks like when it's loading the first page.
                  firstPageProgressIndicatorBuilder: (_) => Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  ),

                  itemBuilder: (context, _, listViewIndex) {
                    final listViewRoomsRecord =
                        _model.pagingController!.itemList![listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x20000000),
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    currentUserPhoto,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: Text(
                                        '${listViewRoomsRecord.host}\'s Lobby',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 0, 0),
                                      child: Text(
                                        'Difficulty : ${listViewRoomsRecord.difficulty}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 0, 0),
                                      child: Text(
                                        'Timer : ${listViewRoomsRecord.timer?.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 0, 0),
                                      child: Text(
                                        'Target : ${listViewRoomsRecord.winCondition?.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final playersCreateData =
                                      createPlayersRecordData(
                                    uid: currentUserUid,
                                    name: currentUserDisplayName,
                                    isTeamSelected: false,
                                    isBlack: false,
                                    score: 0,
                                    isHost: false,
                                  );
                                  var playersRecordReference =
                                      PlayersRecord.createDoc(
                                          listViewRoomsRecord.reference);
                                  await playersRecordReference
                                      .set(playersCreateData);
                                  _model.playerDocument =
                                      PlayersRecord.getDocumentFromData(
                                          playersCreateData,
                                          playersRecordReference);

                                  final roomsUpdateData = {
                                    'numOfPlayers': FieldValue.increment(1),
                                  };
                                  await listViewRoomsRecord.reference
                                      .update(roomsUpdateData);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PregamePageWidget(
                                        roomDetails:
                                            listViewRoomsRecord.reference,
                                        playerdoc:
                                            _model.playerDocument!.reference,
                                      ),
                                    ),
                                  );

                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.login,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
