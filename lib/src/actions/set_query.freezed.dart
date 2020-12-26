// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of set_query;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SetQueryTearOff {
  const _$SetQueryTearOff();

// ignore: unused_element
  _SetQuery call(@nullable String query) {
    return _SetQuery(
      query,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SetQuery = _$SetQueryTearOff();

/// @nodoc
mixin _$SetQuery {
  @nullable
  String get query;

  $SetQueryCopyWith<SetQuery> get copyWith;
}

/// @nodoc
abstract class $SetQueryCopyWith<$Res> {
  factory $SetQueryCopyWith(SetQuery value, $Res Function(SetQuery) then) =
      _$SetQueryCopyWithImpl<$Res>;
  $Res call({@nullable String query});
}

/// @nodoc
class _$SetQueryCopyWithImpl<$Res> implements $SetQueryCopyWith<$Res> {
  _$SetQueryCopyWithImpl(this._value, this._then);

  final SetQuery _value;
  // ignore: unused_field
  final $Res Function(SetQuery) _then;

  @override
  $Res call({
    Object query = freezed,
  }) {
    return _then(_value.copyWith(
      query: query == freezed ? _value.query : query as String,
    ));
  }
}

/// @nodoc
abstract class _$SetQueryCopyWith<$Res> implements $SetQueryCopyWith<$Res> {
  factory _$SetQueryCopyWith(_SetQuery value, $Res Function(_SetQuery) then) =
      __$SetQueryCopyWithImpl<$Res>;
  @override
  $Res call({@nullable String query});
}

/// @nodoc
class __$SetQueryCopyWithImpl<$Res> extends _$SetQueryCopyWithImpl<$Res>
    implements _$SetQueryCopyWith<$Res> {
  __$SetQueryCopyWithImpl(_SetQuery _value, $Res Function(_SetQuery) _then)
      : super(_value, (v) => _then(v as _SetQuery));

  @override
  _SetQuery get _value => super._value as _SetQuery;

  @override
  $Res call({
    Object query = freezed,
  }) {
    return _then(_SetQuery(
      query == freezed ? _value.query : query as String,
    ));
  }
}

/// @nodoc
class _$_SetQuery implements _SetQuery {
  const _$_SetQuery(@nullable this.query);

  @override
  @nullable
  final String query;

  @override
  String toString() {
    return 'SetQuery(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetQuery &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @override
  _$SetQueryCopyWith<_SetQuery> get copyWith =>
      __$SetQueryCopyWithImpl<_SetQuery>(this, _$identity);
}

abstract class _SetQuery implements SetQuery {
  const factory _SetQuery(@nullable String query) = _$_SetQuery;

  @override
  @nullable
  String get query;
  @override
  _$SetQueryCopyWith<_SetQuery> get copyWith;
}
