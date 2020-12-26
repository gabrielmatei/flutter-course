// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of set_color;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SetColorTearOff {
  const _$SetColorTearOff();

// ignore: unused_element
  _SetColor call(@nullable String color) {
    return _SetColor(
      color,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SetColor = _$SetColorTearOff();

/// @nodoc
mixin _$SetColor {
  @nullable
  String get color;

  $SetColorCopyWith<SetColor> get copyWith;
}

/// @nodoc
abstract class $SetColorCopyWith<$Res> {
  factory $SetColorCopyWith(SetColor value, $Res Function(SetColor) then) =
      _$SetColorCopyWithImpl<$Res>;
  $Res call({@nullable String color});
}

/// @nodoc
class _$SetColorCopyWithImpl<$Res> implements $SetColorCopyWith<$Res> {
  _$SetColorCopyWithImpl(this._value, this._then);

  final SetColor _value;
  // ignore: unused_field
  final $Res Function(SetColor) _then;

  @override
  $Res call({
    Object color = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed ? _value.color : color as String,
    ));
  }
}

/// @nodoc
abstract class _$SetColorCopyWith<$Res> implements $SetColorCopyWith<$Res> {
  factory _$SetColorCopyWith(_SetColor value, $Res Function(_SetColor) then) =
      __$SetColorCopyWithImpl<$Res>;
  @override
  $Res call({@nullable String color});
}

/// @nodoc
class __$SetColorCopyWithImpl<$Res> extends _$SetColorCopyWithImpl<$Res>
    implements _$SetColorCopyWith<$Res> {
  __$SetColorCopyWithImpl(_SetColor _value, $Res Function(_SetColor) _then)
      : super(_value, (v) => _then(v as _SetColor));

  @override
  _SetColor get _value => super._value as _SetColor;

  @override
  $Res call({
    Object color = freezed,
  }) {
    return _then(_SetColor(
      color == freezed ? _value.color : color as String,
    ));
  }
}

/// @nodoc
class _$_SetColor implements _SetColor {
  const _$_SetColor(@nullable this.color);

  @override
  @nullable
  final String color;

  @override
  String toString() {
    return 'SetColor(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetColor &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @override
  _$SetColorCopyWith<_SetColor> get copyWith =>
      __$SetColorCopyWithImpl<_SetColor>(this, _$identity);
}

abstract class _SetColor implements SetColor {
  const factory _SetColor(@nullable String color) = _$_SetColor;

  @override
  @nullable
  String get color;
  @override
  _$SetColorCopyWith<_SetColor> get copyWith;
}
