// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RoomsRecord> _$roomsRecordSerializer = new _$RoomsRecordSerializer();

class _$RoomsRecordSerializer implements StructuredSerializer<RoomsRecord> {
  @override
  final Iterable<Type> types = const [RoomsRecord, _$RoomsRecord];
  @override
  final String wireName = 'RoomsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RoomsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.host;
    if (value != null) {
      result
        ..add('host')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isStarted;
    if (value != null) {
      result
        ..add('is_started')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.difficulty;
    if (value != null) {
      result
        ..add('difficulty')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.difficulties;
    if (value != null) {
      result
        ..add('difficulties')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.currQuestion;
    if (value != null) {
      result
        ..add('currQuestion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.winCondition;
    if (value != null) {
      result
        ..add('winCondition')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.questionList;
    if (value != null) {
      result
        ..add('questionList')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.timer;
    if (value != null) {
      result
        ..add('timer')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.round;
    if (value != null) {
      result
        ..add('round')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.everyoneJoined;
    if (value != null) {
      result
        ..add('everyoneJoined')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.numOfPlayers;
    if (value != null) {
      result
        ..add('numOfPlayers')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.joinedPlayers;
    if (value != null) {
      result
        ..add('joinedPlayers')
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
  RoomsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoomsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'host':
          result.host = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_started':
          result.isStarted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'difficulty':
          result.difficulty = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'difficulties':
          result.difficulties.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'currQuestion':
          result.currQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'winCondition':
          result.winCondition = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'questionList':
          result.questionList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'timer':
          result.timer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'round':
          result.round = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'everyoneJoined':
          result.everyoneJoined = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'numOfPlayers':
          result.numOfPlayers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'joinedPlayers':
          result.joinedPlayers = serializers.deserialize(value,
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

class _$RoomsRecord extends RoomsRecord {
  @override
  final String? host;
  @override
  final bool? isStarted;
  @override
  final String? code;
  @override
  final String? difficulty;
  @override
  final BuiltList<String>? difficulties;
  @override
  final String? currQuestion;
  @override
  final int? winCondition;
  @override
  final BuiltList<String>? questionList;
  @override
  final int? timer;
  @override
  final int? round;
  @override
  final bool? everyoneJoined;
  @override
  final int? numOfPlayers;
  @override
  final int? joinedPlayers;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RoomsRecord([void Function(RoomsRecordBuilder)? updates]) =>
      (new RoomsRecordBuilder()..update(updates))._build();

  _$RoomsRecord._(
      {this.host,
      this.isStarted,
      this.code,
      this.difficulty,
      this.difficulties,
      this.currQuestion,
      this.winCondition,
      this.questionList,
      this.timer,
      this.round,
      this.everyoneJoined,
      this.numOfPlayers,
      this.joinedPlayers,
      this.ffRef})
      : super._();

  @override
  RoomsRecord rebuild(void Function(RoomsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomsRecordBuilder toBuilder() => new RoomsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoomsRecord &&
        host == other.host &&
        isStarted == other.isStarted &&
        code == other.code &&
        difficulty == other.difficulty &&
        difficulties == other.difficulties &&
        currQuestion == other.currQuestion &&
        winCondition == other.winCondition &&
        questionList == other.questionList &&
        timer == other.timer &&
        round == other.round &&
        everyoneJoined == other.everyoneJoined &&
        numOfPlayers == other.numOfPlayers &&
        joinedPlayers == other.joinedPlayers &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, host.hashCode),
                                                        isStarted.hashCode),
                                                    code.hashCode),
                                                difficulty.hashCode),
                                            difficulties.hashCode),
                                        currQuestion.hashCode),
                                    winCondition.hashCode),
                                questionList.hashCode),
                            timer.hashCode),
                        round.hashCode),
                    everyoneJoined.hashCode),
                numOfPlayers.hashCode),
            joinedPlayers.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoomsRecord')
          ..add('host', host)
          ..add('isStarted', isStarted)
          ..add('code', code)
          ..add('difficulty', difficulty)
          ..add('difficulties', difficulties)
          ..add('currQuestion', currQuestion)
          ..add('winCondition', winCondition)
          ..add('questionList', questionList)
          ..add('timer', timer)
          ..add('round', round)
          ..add('everyoneJoined', everyoneJoined)
          ..add('numOfPlayers', numOfPlayers)
          ..add('joinedPlayers', joinedPlayers)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RoomsRecordBuilder implements Builder<RoomsRecord, RoomsRecordBuilder> {
  _$RoomsRecord? _$v;

  String? _host;
  String? get host => _$this._host;
  set host(String? host) => _$this._host = host;

  bool? _isStarted;
  bool? get isStarted => _$this._isStarted;
  set isStarted(bool? isStarted) => _$this._isStarted = isStarted;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _difficulty;
  String? get difficulty => _$this._difficulty;
  set difficulty(String? difficulty) => _$this._difficulty = difficulty;

  ListBuilder<String>? _difficulties;
  ListBuilder<String> get difficulties =>
      _$this._difficulties ??= new ListBuilder<String>();
  set difficulties(ListBuilder<String>? difficulties) =>
      _$this._difficulties = difficulties;

  String? _currQuestion;
  String? get currQuestion => _$this._currQuestion;
  set currQuestion(String? currQuestion) => _$this._currQuestion = currQuestion;

  int? _winCondition;
  int? get winCondition => _$this._winCondition;
  set winCondition(int? winCondition) => _$this._winCondition = winCondition;

  ListBuilder<String>? _questionList;
  ListBuilder<String> get questionList =>
      _$this._questionList ??= new ListBuilder<String>();
  set questionList(ListBuilder<String>? questionList) =>
      _$this._questionList = questionList;

  int? _timer;
  int? get timer => _$this._timer;
  set timer(int? timer) => _$this._timer = timer;

  int? _round;
  int? get round => _$this._round;
  set round(int? round) => _$this._round = round;

  bool? _everyoneJoined;
  bool? get everyoneJoined => _$this._everyoneJoined;
  set everyoneJoined(bool? everyoneJoined) =>
      _$this._everyoneJoined = everyoneJoined;

  int? _numOfPlayers;
  int? get numOfPlayers => _$this._numOfPlayers;
  set numOfPlayers(int? numOfPlayers) => _$this._numOfPlayers = numOfPlayers;

  int? _joinedPlayers;
  int? get joinedPlayers => _$this._joinedPlayers;
  set joinedPlayers(int? joinedPlayers) =>
      _$this._joinedPlayers = joinedPlayers;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RoomsRecordBuilder() {
    RoomsRecord._initializeBuilder(this);
  }

  RoomsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _host = $v.host;
      _isStarted = $v.isStarted;
      _code = $v.code;
      _difficulty = $v.difficulty;
      _difficulties = $v.difficulties?.toBuilder();
      _currQuestion = $v.currQuestion;
      _winCondition = $v.winCondition;
      _questionList = $v.questionList?.toBuilder();
      _timer = $v.timer;
      _round = $v.round;
      _everyoneJoined = $v.everyoneJoined;
      _numOfPlayers = $v.numOfPlayers;
      _joinedPlayers = $v.joinedPlayers;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoomsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoomsRecord;
  }

  @override
  void update(void Function(RoomsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoomsRecord build() => _build();

  _$RoomsRecord _build() {
    _$RoomsRecord _$result;
    try {
      _$result = _$v ??
          new _$RoomsRecord._(
              host: host,
              isStarted: isStarted,
              code: code,
              difficulty: difficulty,
              difficulties: _difficulties?.build(),
              currQuestion: currQuestion,
              winCondition: winCondition,
              questionList: _questionList?.build(),
              timer: timer,
              round: round,
              everyoneJoined: everyoneJoined,
              numOfPlayers: numOfPlayers,
              joinedPlayers: joinedPlayers,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'difficulties';
        _difficulties?.build();

        _$failedField = 'questionList';
        _questionList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RoomsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
