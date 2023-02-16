import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'players_record.g.dart';

abstract class PlayersRecord
    implements Built<PlayersRecord, PlayersRecordBuilder> {
  static Serializer<PlayersRecord> get serializer => _$playersRecordSerializer;

  String? get uid;

  String? get name;

  bool? get isTeamSelected;

  bool? get isBlack;

  int? get score;

  bool? get isHost;

  bool? get hasJoined;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PlayersRecordBuilder builder) => builder
    ..uid = ''
    ..name = ''
    ..isTeamSelected = false
    ..isBlack = false
    ..score = 0
    ..isHost = false
    ..hasJoined = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('players')
          : FirebaseFirestore.instance.collectionGroup('players');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('players').doc();

  static Stream<PlayersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PlayersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PlayersRecord._();
  factory PlayersRecord([void Function(PlayersRecordBuilder) updates]) =
      _$PlayersRecord;

  static PlayersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPlayersRecordData({
  String? uid,
  String? name,
  bool? isTeamSelected,
  bool? isBlack,
  int? score,
  bool? isHost,
  bool? hasJoined,
}) {
  final firestoreData = serializers.toFirestore(
    PlayersRecord.serializer,
    PlayersRecord(
      (p) => p
        ..uid = uid
        ..name = name
        ..isTeamSelected = isTeamSelected
        ..isBlack = isBlack
        ..score = score
        ..isHost = isHost
        ..hasJoined = hasJoined,
    ),
  );

  return firestoreData;
}
