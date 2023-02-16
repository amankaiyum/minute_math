// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_set_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DailySetRecord> _$dailySetRecordSerializer =
    new _$DailySetRecordSerializer();

class _$DailySetRecordSerializer
    implements StructuredSerializer<DailySetRecord> {
  @override
  final Iterable<Type> types = const [DailySetRecord, _$DailySetRecord];
  @override
  final String wireName = 'DailySetRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DailySetRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.dailySet;
    if (value != null) {
      result
        ..add('dailySet')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.resetTime;
    if (value != null) {
      result
        ..add('resetTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dailySet30s;
    if (value != null) {
      result
        ..add('dailySet30s')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.dailySet15s;
    if (value != null) {
      result
        ..add('dailySet15s')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.resetTime15s;
    if (value != null) {
      result
        ..add('resetTime15s')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.resetTime30s;
    if (value != null) {
      result
        ..add('resetTime30s')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastUpdated;
    if (value != null) {
      result
        ..add('lastUpdated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  DailySetRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DailySetRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dailySet':
          result.dailySet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'resetTime':
          result.resetTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'dailySet30s':
          result.dailySet30s.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'dailySet15s':
          result.dailySet15s.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'resetTime15s':
          result.resetTime15s = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'resetTime30s':
          result.resetTime30s = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'lastUpdated':
          result.lastUpdated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$DailySetRecord extends DailySetRecord {
  @override
  final BuiltList<String>? dailySet;
  @override
  final DateTime? resetTime;
  @override
  final BuiltList<String>? dailySet30s;
  @override
  final BuiltList<String>? dailySet15s;
  @override
  final DateTime? resetTime15s;
  @override
  final DateTime? resetTime30s;
  @override
  final DateTime? lastUpdated;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DailySetRecord([void Function(DailySetRecordBuilder)? updates]) =>
      (new DailySetRecordBuilder()..update(updates))._build();

  _$DailySetRecord._(
      {this.dailySet,
      this.resetTime,
      this.dailySet30s,
      this.dailySet15s,
      this.resetTime15s,
      this.resetTime30s,
      this.lastUpdated,
      this.ffRef})
      : super._();

  @override
  DailySetRecord rebuild(void Function(DailySetRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DailySetRecordBuilder toBuilder() =>
      new DailySetRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DailySetRecord &&
        dailySet == other.dailySet &&
        resetTime == other.resetTime &&
        dailySet30s == other.dailySet30s &&
        dailySet15s == other.dailySet15s &&
        resetTime15s == other.resetTime15s &&
        resetTime30s == other.resetTime30s &&
        lastUpdated == other.lastUpdated &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, dailySet.hashCode), resetTime.hashCode),
                            dailySet30s.hashCode),
                        dailySet15s.hashCode),
                    resetTime15s.hashCode),
                resetTime30s.hashCode),
            lastUpdated.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DailySetRecord')
          ..add('dailySet', dailySet)
          ..add('resetTime', resetTime)
          ..add('dailySet30s', dailySet30s)
          ..add('dailySet15s', dailySet15s)
          ..add('resetTime15s', resetTime15s)
          ..add('resetTime30s', resetTime30s)
          ..add('lastUpdated', lastUpdated)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DailySetRecordBuilder
    implements Builder<DailySetRecord, DailySetRecordBuilder> {
  _$DailySetRecord? _$v;

  ListBuilder<String>? _dailySet;
  ListBuilder<String> get dailySet =>
      _$this._dailySet ??= new ListBuilder<String>();
  set dailySet(ListBuilder<String>? dailySet) => _$this._dailySet = dailySet;

  DateTime? _resetTime;
  DateTime? get resetTime => _$this._resetTime;
  set resetTime(DateTime? resetTime) => _$this._resetTime = resetTime;

  ListBuilder<String>? _dailySet30s;
  ListBuilder<String> get dailySet30s =>
      _$this._dailySet30s ??= new ListBuilder<String>();
  set dailySet30s(ListBuilder<String>? dailySet30s) =>
      _$this._dailySet30s = dailySet30s;

  ListBuilder<String>? _dailySet15s;
  ListBuilder<String> get dailySet15s =>
      _$this._dailySet15s ??= new ListBuilder<String>();
  set dailySet15s(ListBuilder<String>? dailySet15s) =>
      _$this._dailySet15s = dailySet15s;

  DateTime? _resetTime15s;
  DateTime? get resetTime15s => _$this._resetTime15s;
  set resetTime15s(DateTime? resetTime15s) =>
      _$this._resetTime15s = resetTime15s;

  DateTime? _resetTime30s;
  DateTime? get resetTime30s => _$this._resetTime30s;
  set resetTime30s(DateTime? resetTime30s) =>
      _$this._resetTime30s = resetTime30s;

  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _$this._lastUpdated;
  set lastUpdated(DateTime? lastUpdated) => _$this._lastUpdated = lastUpdated;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DailySetRecordBuilder() {
    DailySetRecord._initializeBuilder(this);
  }

  DailySetRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dailySet = $v.dailySet?.toBuilder();
      _resetTime = $v.resetTime;
      _dailySet30s = $v.dailySet30s?.toBuilder();
      _dailySet15s = $v.dailySet15s?.toBuilder();
      _resetTime15s = $v.resetTime15s;
      _resetTime30s = $v.resetTime30s;
      _lastUpdated = $v.lastUpdated;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DailySetRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DailySetRecord;
  }

  @override
  void update(void Function(DailySetRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DailySetRecord build() => _build();

  _$DailySetRecord _build() {
    _$DailySetRecord _$result;
    try {
      _$result = _$v ??
          new _$DailySetRecord._(
              dailySet: _dailySet?.build(),
              resetTime: resetTime,
              dailySet30s: _dailySet30s?.build(),
              dailySet15s: _dailySet15s?.build(),
              resetTime15s: resetTime15s,
              resetTime30s: resetTime30s,
              lastUpdated: lastUpdated,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dailySet';
        _dailySet?.build();

        _$failedField = 'dailySet30s';
        _dailySet30s?.build();
        _$failedField = 'dailySet15s';
        _dailySet15s?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DailySetRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
