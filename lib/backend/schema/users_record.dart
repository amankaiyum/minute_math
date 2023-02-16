import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'daily_score')
  int? get dailyScore;

  @BuiltValueField(wireName: 'best_score')
  int? get bestScore;

  @BuiltValueField(wireName: 'avg_daily_score')
  double? get avgDailyScore;

  @BuiltValueField(wireName: 'days_played')
  int? get daysPlayed;

  @BuiltValueField(wireName: 'ds_15s_score')
  int? get ds15sScore;

  @BuiltValueField(wireName: 'ds_15s_avg')
  double? get ds15sAvg;

  @BuiltValueField(wireName: 'ds_15s_best')
  int? get ds15sBest;

  @BuiltValueField(wireName: 'ds_15s_dp')
  int? get ds15sDp;

  @BuiltValueField(wireName: 'ds_30s_score')
  int? get ds30sScore;

  @BuiltValueField(wireName: 'ds_30s_avg')
  double? get ds30sAvg;

  @BuiltValueField(wireName: 'ds_30s_best')
  int? get ds30sBest;

  @BuiltValueField(wireName: 'ds_30s_dp')
  int? get ds30sDp;

  @BuiltValueField(wireName: 'TTEasy')
  int? get tTEasy;

  @BuiltValueField(wireName: 'TTMedium')
  int? get tTMedium;

  @BuiltValueField(wireName: 'TTHard')
  int? get tTHard;

  @BuiltValueField(wireName: 'TTHell')
  int? get tTHell;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..dailyScore = 0
    ..bestScore = 0
    ..avgDailyScore = 0.0
    ..daysPlayed = 0
    ..ds15sScore = 0
    ..ds15sAvg = 0.0
    ..ds15sBest = 0
    ..ds15sDp = 0
    ..ds30sScore = 0
    ..ds30sAvg = 0.0
    ..ds30sBest = 0
    ..ds30sDp = 0
    ..tTEasy = 0
    ..tTMedium = 0
    ..tTHard = 0
    ..tTHell = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? dailyScore,
  int? bestScore,
  double? avgDailyScore,
  int? daysPlayed,
  int? ds15sScore,
  double? ds15sAvg,
  int? ds15sBest,
  int? ds15sDp,
  int? ds30sScore,
  double? ds30sAvg,
  int? ds30sBest,
  int? ds30sDp,
  int? tTEasy,
  int? tTMedium,
  int? tTHard,
  int? tTHell,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..dailyScore = dailyScore
        ..bestScore = bestScore
        ..avgDailyScore = avgDailyScore
        ..daysPlayed = daysPlayed
        ..ds15sScore = ds15sScore
        ..ds15sAvg = ds15sAvg
        ..ds15sBest = ds15sBest
        ..ds15sDp = ds15sDp
        ..ds30sScore = ds30sScore
        ..ds30sAvg = ds30sAvg
        ..ds30sBest = ds30sBest
        ..ds30sDp = ds30sDp
        ..tTEasy = tTEasy
        ..tTMedium = tTMedium
        ..tTHard = tTHard
        ..tTHell = tTHell,
    ),
  );

  return firestoreData;
}
