// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_scores_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserScoresRecord> _$userScoresRecordSerializer =
    new _$UserScoresRecordSerializer();

class _$UserScoresRecordSerializer
    implements StructuredSerializer<UserScoresRecord> {
  @override
  final Iterable<Type> types = const [UserScoresRecord, _$UserScoresRecord];
  @override
  final String wireName = 'UserScoresRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserScoresRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.score;
    if (value != null) {
      result
        ..add('score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  UserScoresRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserScoresRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$UserScoresRecord extends UserScoresRecord {
  @override
  final String? username;
  @override
  final int? score;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserScoresRecord(
          [void Function(UserScoresRecordBuilder)? updates]) =>
      (new UserScoresRecordBuilder()..update(updates))._build();

  _$UserScoresRecord._({this.username, this.score, this.ffRef}) : super._();

  @override
  UserScoresRecord rebuild(void Function(UserScoresRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserScoresRecordBuilder toBuilder() =>
      new UserScoresRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserScoresRecord &&
        username == other.username &&
        score == other.score &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, username.hashCode), score.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserScoresRecord')
          ..add('username', username)
          ..add('score', score)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserScoresRecordBuilder
    implements Builder<UserScoresRecord, UserScoresRecordBuilder> {
  _$UserScoresRecord? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  int? _score;
  int? get score => _$this._score;
  set score(int? score) => _$this._score = score;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserScoresRecordBuilder() {
    UserScoresRecord._initializeBuilder(this);
  }

  UserScoresRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _score = $v.score;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserScoresRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserScoresRecord;
  }

  @override
  void update(void Function(UserScoresRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserScoresRecord build() => _build();

  _$UserScoresRecord _build() {
    final _$result = _$v ??
        new _$UserScoresRecord._(
            username: username, score: score, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
