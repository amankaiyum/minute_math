// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'players_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlayersRecord> _$playersRecordSerializer =
    new _$PlayersRecordSerializer();

class _$PlayersRecordSerializer implements StructuredSerializer<PlayersRecord> {
  @override
  final Iterable<Type> types = const [PlayersRecord, _$PlayersRecord];
  @override
  final String wireName = 'PlayersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PlayersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isTeamSelected;
    if (value != null) {
      result
        ..add('isTeamSelected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isBlack;
    if (value != null) {
      result
        ..add('isBlack')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.score;
    if (value != null) {
      result
        ..add('score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isHost;
    if (value != null) {
      result
        ..add('isHost')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasJoined;
    if (value != null) {
      result
        ..add('hasJoined')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  PlayersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlayersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isTeamSelected':
          result.isTeamSelected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isBlack':
          result.isBlack = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isHost':
          result.isHost = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'hasJoined':
          result.hasJoined = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$PlayersRecord extends PlayersRecord {
  @override
  final String? uid;
  @override
  final String? name;
  @override
  final bool? isTeamSelected;
  @override
  final bool? isBlack;
  @override
  final int? score;
  @override
  final bool? isHost;
  @override
  final bool? hasJoined;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PlayersRecord([void Function(PlayersRecordBuilder)? updates]) =>
      (new PlayersRecordBuilder()..update(updates))._build();

  _$PlayersRecord._(
      {this.uid,
      this.name,
      this.isTeamSelected,
      this.isBlack,
      this.score,
      this.isHost,
      this.hasJoined,
      this.ffRef})
      : super._();

  @override
  PlayersRecord rebuild(void Function(PlayersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayersRecordBuilder toBuilder() => new PlayersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlayersRecord &&
        uid == other.uid &&
        name == other.name &&
        isTeamSelected == other.isTeamSelected &&
        isBlack == other.isBlack &&
        score == other.score &&
        isHost == other.isHost &&
        hasJoined == other.hasJoined &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, uid.hashCode), name.hashCode),
                            isTeamSelected.hashCode),
                        isBlack.hashCode),
                    score.hashCode),
                isHost.hashCode),
            hasJoined.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlayersRecord')
          ..add('uid', uid)
          ..add('name', name)
          ..add('isTeamSelected', isTeamSelected)
          ..add('isBlack', isBlack)
          ..add('score', score)
          ..add('isHost', isHost)
          ..add('hasJoined', hasJoined)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PlayersRecordBuilder
    implements Builder<PlayersRecord, PlayersRecordBuilder> {
  _$PlayersRecord? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isTeamSelected;
  bool? get isTeamSelected => _$this._isTeamSelected;
  set isTeamSelected(bool? isTeamSelected) =>
      _$this._isTeamSelected = isTeamSelected;

  bool? _isBlack;
  bool? get isBlack => _$this._isBlack;
  set isBlack(bool? isBlack) => _$this._isBlack = isBlack;

  int? _score;
  int? get score => _$this._score;
  set score(int? score) => _$this._score = score;

  bool? _isHost;
  bool? get isHost => _$this._isHost;
  set isHost(bool? isHost) => _$this._isHost = isHost;

  bool? _hasJoined;
  bool? get hasJoined => _$this._hasJoined;
  set hasJoined(bool? hasJoined) => _$this._hasJoined = hasJoined;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PlayersRecordBuilder() {
    PlayersRecord._initializeBuilder(this);
  }

  PlayersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _name = $v.name;
      _isTeamSelected = $v.isTeamSelected;
      _isBlack = $v.isBlack;
      _score = $v.score;
      _isHost = $v.isHost;
      _hasJoined = $v.hasJoined;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlayersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlayersRecord;
  }

  @override
  void update(void Function(PlayersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PlayersRecord build() => _build();

  _$PlayersRecord _build() {
    final _$result = _$v ??
        new _$PlayersRecord._(
            uid: uid,
            name: name,
            isTeamSelected: isTeamSelected,
            isBlack: isBlack,
            score: score,
            isHost: isHost,
            hasJoined: hasJoined,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
