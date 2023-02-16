import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'rooms_record.g.dart';

abstract class RoomsRecord implements Built<RoomsRecord, RoomsRecordBuilder> {
  static Serializer<RoomsRecord> get serializer => _$roomsRecordSerializer;

  String? get host;

  @BuiltValueField(wireName: 'is_started')
  bool? get isStarted;

  String? get code;

  String? get difficulty;

  BuiltList<String>? get difficulties;

  String? get currQuestion;

  int? get winCondition;

  BuiltList<String>? get questionList;

  int? get timer;

  int? get round;

  bool? get everyoneJoined;

  int? get numOfPlayers;

  int? get joinedPlayers;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RoomsRecordBuilder builder) => builder
    ..host = ''
    ..isStarted = false
    ..code = ''
    ..difficulty = ''
    ..difficulties = ListBuilder()
    ..currQuestion = ''
    ..winCondition = 0
    ..questionList = ListBuilder()
    ..timer = 0
    ..round = 0
    ..everyoneJoined = false
    ..numOfPlayers = 0
    ..joinedPlayers = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rooms');

  static Stream<RoomsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RoomsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RoomsRecord._();
  factory RoomsRecord([void Function(RoomsRecordBuilder) updates]) =
      _$RoomsRecord;

  static RoomsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRoomsRecordData({
  String? host,
  bool? isStarted,
  String? code,
  String? difficulty,
  String? currQuestion,
  int? winCondition,
  int? timer,
  int? round,
  bool? everyoneJoined,
  int? numOfPlayers,
  int? joinedPlayers,
}) {
  final firestoreData = serializers.toFirestore(
    RoomsRecord.serializer,
    RoomsRecord(
      (r) => r
        ..host = host
        ..isStarted = isStarted
        ..code = code
        ..difficulty = difficulty
        ..difficulties = null
        ..currQuestion = currQuestion
        ..winCondition = winCondition
        ..questionList = null
        ..timer = timer
        ..round = round
        ..everyoneJoined = everyoneJoined
        ..numOfPlayers = numOfPlayers
        ..joinedPlayers = joinedPlayers,
    ),
  );

  return firestoreData;
}
