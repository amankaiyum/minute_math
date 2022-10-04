import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_scores_record.g.dart';

abstract class UserScoresRecord
    implements Built<UserScoresRecord, UserScoresRecordBuilder> {
  static Serializer<UserScoresRecord> get serializer =>
      _$userScoresRecordSerializer;

  String? get username;

  int? get score;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserScoresRecordBuilder builder) => builder
    ..username = ''
    ..score = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_scores');

  static Stream<UserScoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserScoresRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserScoresRecord._();
  factory UserScoresRecord([void Function(UserScoresRecordBuilder) updates]) =
      _$UserScoresRecord;

  static UserScoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserScoresRecordData({
  String? username,
  int? score,
}) {
  final firestoreData = serializers.toFirestore(
    UserScoresRecord.serializer,
    UserScoresRecord(
      (u) => u
        ..username = username
        ..score = score,
    ),
  );

  return firestoreData;
}
