import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'daily_question_set_record.g.dart';

abstract class DailyQuestionSetRecord
    implements Built<DailyQuestionSetRecord, DailyQuestionSetRecordBuilder> {
  static Serializer<DailyQuestionSetRecord> get serializer =>
      _$dailyQuestionSetRecordSerializer;

  @BuiltValueField(wireName: 'Questions')
  BuiltList<String>? get questions;

  @BuiltValueField(wireName: 'Answers')
  BuiltList<String>? get answers;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DailyQuestionSetRecordBuilder builder) =>
      builder
        ..questions = ListBuilder()
        ..answers = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DailyQuestionSet');

  static Stream<DailyQuestionSetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DailyQuestionSetRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DailyQuestionSetRecord._();
  factory DailyQuestionSetRecord(
          [void Function(DailyQuestionSetRecordBuilder) updates]) =
      _$DailyQuestionSetRecord;

  static DailyQuestionSetRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDailyQuestionSetRecordData() {
  final firestoreData = serializers.toFirestore(
    DailyQuestionSetRecord.serializer,
    DailyQuestionSetRecord(
      (d) => d
        ..questions = null
        ..answers = null,
    ),
  );

  return firestoreData;
}
