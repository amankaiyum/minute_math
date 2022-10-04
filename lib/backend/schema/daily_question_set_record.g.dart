// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_question_set_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DailyQuestionSetRecord> _$dailyQuestionSetRecordSerializer =
    new _$DailyQuestionSetRecordSerializer();

class _$DailyQuestionSetRecordSerializer
    implements StructuredSerializer<DailyQuestionSetRecord> {
  @override
  final Iterable<Type> types = const [
    DailyQuestionSetRecord,
    _$DailyQuestionSetRecord
  ];
  @override
  final String wireName = 'DailyQuestionSetRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DailyQuestionSetRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.questions;
    if (value != null) {
      result
        ..add('Questions')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.answers;
    if (value != null) {
      result
        ..add('Answers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  DailyQuestionSetRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DailyQuestionSetRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Questions':
          result.questions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Answers':
          result.answers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$DailyQuestionSetRecord extends DailyQuestionSetRecord {
  @override
  final BuiltList<String>? questions;
  @override
  final BuiltList<String>? answers;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DailyQuestionSetRecord(
          [void Function(DailyQuestionSetRecordBuilder)? updates]) =>
      (new DailyQuestionSetRecordBuilder()..update(updates))._build();

  _$DailyQuestionSetRecord._({this.questions, this.answers, this.ffRef})
      : super._();

  @override
  DailyQuestionSetRecord rebuild(
          void Function(DailyQuestionSetRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DailyQuestionSetRecordBuilder toBuilder() =>
      new DailyQuestionSetRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DailyQuestionSetRecord &&
        questions == other.questions &&
        answers == other.answers &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, questions.hashCode), answers.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DailyQuestionSetRecord')
          ..add('questions', questions)
          ..add('answers', answers)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DailyQuestionSetRecordBuilder
    implements Builder<DailyQuestionSetRecord, DailyQuestionSetRecordBuilder> {
  _$DailyQuestionSetRecord? _$v;

  ListBuilder<String>? _questions;
  ListBuilder<String> get questions =>
      _$this._questions ??= new ListBuilder<String>();
  set questions(ListBuilder<String>? questions) =>
      _$this._questions = questions;

  ListBuilder<String>? _answers;
  ListBuilder<String> get answers =>
      _$this._answers ??= new ListBuilder<String>();
  set answers(ListBuilder<String>? answers) => _$this._answers = answers;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DailyQuestionSetRecordBuilder() {
    DailyQuestionSetRecord._initializeBuilder(this);
  }

  DailyQuestionSetRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questions = $v.questions?.toBuilder();
      _answers = $v.answers?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DailyQuestionSetRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DailyQuestionSetRecord;
  }

  @override
  void update(void Function(DailyQuestionSetRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DailyQuestionSetRecord build() => _build();

  _$DailyQuestionSetRecord _build() {
    _$DailyQuestionSetRecord _$result;
    try {
      _$result = _$v ??
          new _$DailyQuestionSetRecord._(
              questions: _questions?.build(),
              answers: _answers?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'questions';
        _questions?.build();
        _$failedField = 'answers';
        _answers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DailyQuestionSetRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
