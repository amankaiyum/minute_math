import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'daily_set_record.g.dart';

abstract class DailySetRecord
    implements Built<DailySetRecord, DailySetRecordBuilder> {
  static Serializer<DailySetRecord> get serializer =>
      _$dailySetRecordSerializer;

  BuiltList<String>? get dailySet;

  DateTime? get resetTime;

  BuiltList<String>? get dailySet30s;

  BuiltList<String>? get dailySet15s;

  DateTime? get resetTime15s;

  DateTime? get resetTime30s;

  DateTime? get lastUpdated;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DailySetRecordBuilder builder) => builder
    ..dailySet = ListBuilder()
    ..dailySet30s = ListBuilder()
    ..dailySet15s = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dailySet');

  static Stream<DailySetRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DailySetRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DailySetRecord._();
  factory DailySetRecord([void Function(DailySetRecordBuilder) updates]) =
      _$DailySetRecord;

  static DailySetRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDailySetRecordData({
  DateTime? resetTime,
  DateTime? resetTime15s,
  DateTime? resetTime30s,
  DateTime? lastUpdated,
}) {
  final firestoreData = serializers.toFirestore(
    DailySetRecord.serializer,
    DailySetRecord(
      (d) => d
        ..dailySet = null
        ..resetTime = resetTime
        ..dailySet30s = null
        ..dailySet15s = null
        ..resetTime15s = resetTime15s
        ..resetTime30s = resetTime30s
        ..lastUpdated = lastUpdated,
    ),
  );

  return firestoreData;
}
