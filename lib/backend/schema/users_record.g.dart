// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dailyScore;
    if (value != null) {
      result
        ..add('daily_score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.bestScore;
    if (value != null) {
      result
        ..add('best_score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.avgDailyScore;
    if (value != null) {
      result
        ..add('avg_daily_score')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.daysPlayed;
    if (value != null) {
      result
        ..add('days_played')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ds15sScore;
    if (value != null) {
      result
        ..add('ds_15s_score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ds15sAvg;
    if (value != null) {
      result
        ..add('ds_15s_avg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ds15sBest;
    if (value != null) {
      result
        ..add('ds_15s_best')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ds15sDp;
    if (value != null) {
      result
        ..add('ds_15s_dp')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ds30sScore;
    if (value != null) {
      result
        ..add('ds_30s_score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ds30sAvg;
    if (value != null) {
      result
        ..add('ds_30s_avg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ds30sBest;
    if (value != null) {
      result
        ..add('ds_30s_best')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ds30sDp;
    if (value != null) {
      result
        ..add('ds_30s_dp')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tTEasy;
    if (value != null) {
      result
        ..add('TTEasy')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tTMedium;
    if (value != null) {
      result
        ..add('TTMedium')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tTHard;
    if (value != null) {
      result
        ..add('TTHard')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tTHell;
    if (value != null) {
      result
        ..add('TTHell')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'daily_score':
          result.dailyScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'best_score':
          result.bestScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'avg_daily_score':
          result.avgDailyScore = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'days_played':
          result.daysPlayed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ds_15s_score':
          result.ds15sScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ds_15s_avg':
          result.ds15sAvg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ds_15s_best':
          result.ds15sBest = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ds_15s_dp':
          result.ds15sDp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ds_30s_score':
          result.ds30sScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ds_30s_avg':
          result.ds30sAvg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ds_30s_best':
          result.ds30sBest = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ds_30s_dp':
          result.ds30sDp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'TTEasy':
          result.tTEasy = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'TTMedium':
          result.tTMedium = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'TTHard':
          result.tTHard = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'TTHell':
          result.tTHell = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final int? dailyScore;
  @override
  final int? bestScore;
  @override
  final double? avgDailyScore;
  @override
  final int? daysPlayed;
  @override
  final int? ds15sScore;
  @override
  final double? ds15sAvg;
  @override
  final int? ds15sBest;
  @override
  final int? ds15sDp;
  @override
  final int? ds30sScore;
  @override
  final double? ds30sAvg;
  @override
  final int? ds30sBest;
  @override
  final int? ds30sDp;
  @override
  final int? tTEasy;
  @override
  final int? tTMedium;
  @override
  final int? tTHard;
  @override
  final int? tTHell;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.dailyScore,
      this.bestScore,
      this.avgDailyScore,
      this.daysPlayed,
      this.ds15sScore,
      this.ds15sAvg,
      this.ds15sBest,
      this.ds15sDp,
      this.ds30sScore,
      this.ds30sAvg,
      this.ds30sBest,
      this.ds30sDp,
      this.tTEasy,
      this.tTMedium,
      this.tTHard,
      this.tTHell,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        dailyScore == other.dailyScore &&
        bestScore == other.bestScore &&
        avgDailyScore == other.avgDailyScore &&
        daysPlayed == other.daysPlayed &&
        ds15sScore == other.ds15sScore &&
        ds15sAvg == other.ds15sAvg &&
        ds15sBest == other.ds15sBest &&
        ds15sDp == other.ds15sDp &&
        ds30sScore == other.ds30sScore &&
        ds30sAvg == other.ds30sAvg &&
        ds30sBest == other.ds30sBest &&
        ds30sDp == other.ds30sDp &&
        tTEasy == other.tTEasy &&
        tTMedium == other.tTMedium &&
        tTHard == other.tTHard &&
        tTHell == other.tTHell &&
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
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc(0, email.hashCode), displayName.hashCode), photoUrl.hashCode), uid.hashCode),
                                                                                createdTime.hashCode),
                                                                            phoneNumber.hashCode),
                                                                        dailyScore.hashCode),
                                                                    bestScore.hashCode),
                                                                avgDailyScore.hashCode),
                                                            daysPlayed.hashCode),
                                                        ds15sScore.hashCode),
                                                    ds15sAvg.hashCode),
                                                ds15sBest.hashCode),
                                            ds15sDp.hashCode),
                                        ds30sScore.hashCode),
                                    ds30sAvg.hashCode),
                                ds30sBest.hashCode),
                            ds30sDp.hashCode),
                        tTEasy.hashCode),
                    tTMedium.hashCode),
                tTHard.hashCode),
            tTHell.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('dailyScore', dailyScore)
          ..add('bestScore', bestScore)
          ..add('avgDailyScore', avgDailyScore)
          ..add('daysPlayed', daysPlayed)
          ..add('ds15sScore', ds15sScore)
          ..add('ds15sAvg', ds15sAvg)
          ..add('ds15sBest', ds15sBest)
          ..add('ds15sDp', ds15sDp)
          ..add('ds30sScore', ds30sScore)
          ..add('ds30sAvg', ds30sAvg)
          ..add('ds30sBest', ds30sBest)
          ..add('ds30sDp', ds30sDp)
          ..add('tTEasy', tTEasy)
          ..add('tTMedium', tTMedium)
          ..add('tTHard', tTHard)
          ..add('tTHell', tTHell)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  int? _dailyScore;
  int? get dailyScore => _$this._dailyScore;
  set dailyScore(int? dailyScore) => _$this._dailyScore = dailyScore;

  int? _bestScore;
  int? get bestScore => _$this._bestScore;
  set bestScore(int? bestScore) => _$this._bestScore = bestScore;

  double? _avgDailyScore;
  double? get avgDailyScore => _$this._avgDailyScore;
  set avgDailyScore(double? avgDailyScore) =>
      _$this._avgDailyScore = avgDailyScore;

  int? _daysPlayed;
  int? get daysPlayed => _$this._daysPlayed;
  set daysPlayed(int? daysPlayed) => _$this._daysPlayed = daysPlayed;

  int? _ds15sScore;
  int? get ds15sScore => _$this._ds15sScore;
  set ds15sScore(int? ds15sScore) => _$this._ds15sScore = ds15sScore;

  double? _ds15sAvg;
  double? get ds15sAvg => _$this._ds15sAvg;
  set ds15sAvg(double? ds15sAvg) => _$this._ds15sAvg = ds15sAvg;

  int? _ds15sBest;
  int? get ds15sBest => _$this._ds15sBest;
  set ds15sBest(int? ds15sBest) => _$this._ds15sBest = ds15sBest;

  int? _ds15sDp;
  int? get ds15sDp => _$this._ds15sDp;
  set ds15sDp(int? ds15sDp) => _$this._ds15sDp = ds15sDp;

  int? _ds30sScore;
  int? get ds30sScore => _$this._ds30sScore;
  set ds30sScore(int? ds30sScore) => _$this._ds30sScore = ds30sScore;

  double? _ds30sAvg;
  double? get ds30sAvg => _$this._ds30sAvg;
  set ds30sAvg(double? ds30sAvg) => _$this._ds30sAvg = ds30sAvg;

  int? _ds30sBest;
  int? get ds30sBest => _$this._ds30sBest;
  set ds30sBest(int? ds30sBest) => _$this._ds30sBest = ds30sBest;

  int? _ds30sDp;
  int? get ds30sDp => _$this._ds30sDp;
  set ds30sDp(int? ds30sDp) => _$this._ds30sDp = ds30sDp;

  int? _tTEasy;
  int? get tTEasy => _$this._tTEasy;
  set tTEasy(int? tTEasy) => _$this._tTEasy = tTEasy;

  int? _tTMedium;
  int? get tTMedium => _$this._tTMedium;
  set tTMedium(int? tTMedium) => _$this._tTMedium = tTMedium;

  int? _tTHard;
  int? get tTHard => _$this._tTHard;
  set tTHard(int? tTHard) => _$this._tTHard = tTHard;

  int? _tTHell;
  int? get tTHell => _$this._tTHell;
  set tTHell(int? tTHell) => _$this._tTHell = tTHell;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _dailyScore = $v.dailyScore;
      _bestScore = $v.bestScore;
      _avgDailyScore = $v.avgDailyScore;
      _daysPlayed = $v.daysPlayed;
      _ds15sScore = $v.ds15sScore;
      _ds15sAvg = $v.ds15sAvg;
      _ds15sBest = $v.ds15sBest;
      _ds15sDp = $v.ds15sDp;
      _ds30sScore = $v.ds30sScore;
      _ds30sAvg = $v.ds30sAvg;
      _ds30sBest = $v.ds30sBest;
      _ds30sDp = $v.ds30sDp;
      _tTEasy = $v.tTEasy;
      _tTMedium = $v.tTMedium;
      _tTHard = $v.tTHard;
      _tTHell = $v.tTHell;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            dailyScore: dailyScore,
            bestScore: bestScore,
            avgDailyScore: avgDailyScore,
            daysPlayed: daysPlayed,
            ds15sScore: ds15sScore,
            ds15sAvg: ds15sAvg,
            ds15sBest: ds15sBest,
            ds15sDp: ds15sDp,
            ds30sScore: ds30sScore,
            ds30sAvg: ds30sAvg,
            ds30sBest: ds30sBest,
            ds30sDp: ds30sDp,
            tTEasy: tTEasy,
            tTMedium: tTMedium,
            tTHard: tTHard,
            tTHell: tTHell,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
