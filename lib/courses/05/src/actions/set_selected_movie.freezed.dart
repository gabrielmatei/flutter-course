// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of set_selected_movie;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SetSelectedMovieTearOff {
  const _$SetSelectedMovieTearOff();

// ignore: unused_element
  _SetSelectedMovie call(int movieId) {
    return _SetSelectedMovie(
      movieId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SetSelectedMovie = _$SetSelectedMovieTearOff();

/// @nodoc
mixin _$SetSelectedMovie {
  int get movieId;

  $SetSelectedMovieCopyWith<SetSelectedMovie> get copyWith;
}

/// @nodoc
abstract class $SetSelectedMovieCopyWith<$Res> {
  factory $SetSelectedMovieCopyWith(
          SetSelectedMovie value, $Res Function(SetSelectedMovie) then) =
      _$SetSelectedMovieCopyWithImpl<$Res>;
  $Res call({int movieId});
}

/// @nodoc
class _$SetSelectedMovieCopyWithImpl<$Res>
    implements $SetSelectedMovieCopyWith<$Res> {
  _$SetSelectedMovieCopyWithImpl(this._value, this._then);

  final SetSelectedMovie _value;
  // ignore: unused_field
  final $Res Function(SetSelectedMovie) _then;

  @override
  $Res call({
    Object movieId = freezed,
  }) {
    return _then(_value.copyWith(
      movieId: movieId == freezed ? _value.movieId : movieId as int,
    ));
  }
}

/// @nodoc
abstract class _$SetSelectedMovieCopyWith<$Res>
    implements $SetSelectedMovieCopyWith<$Res> {
  factory _$SetSelectedMovieCopyWith(
          _SetSelectedMovie value, $Res Function(_SetSelectedMovie) then) =
      __$SetSelectedMovieCopyWithImpl<$Res>;
  @override
  $Res call({int movieId});
}

/// @nodoc
class __$SetSelectedMovieCopyWithImpl<$Res>
    extends _$SetSelectedMovieCopyWithImpl<$Res>
    implements _$SetSelectedMovieCopyWith<$Res> {
  __$SetSelectedMovieCopyWithImpl(
      _SetSelectedMovie _value, $Res Function(_SetSelectedMovie) _then)
      : super(_value, (v) => _then(v as _SetSelectedMovie));

  @override
  _SetSelectedMovie get _value => super._value as _SetSelectedMovie;

  @override
  $Res call({
    Object movieId = freezed,
  }) {
    return _then(_SetSelectedMovie(
      movieId == freezed ? _value.movieId : movieId as int,
    ));
  }
}

/// @nodoc
class _$_SetSelectedMovie implements _SetSelectedMovie {
  const _$_SetSelectedMovie(this.movieId) : assert(movieId != null);

  @override
  final int movieId;

  @override
  String toString() {
    return 'SetSelectedMovie(movieId: $movieId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetSelectedMovie &&
            (identical(other.movieId, movieId) ||
                const DeepCollectionEquality().equals(other.movieId, movieId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(movieId);

  @override
  _$SetSelectedMovieCopyWith<_SetSelectedMovie> get copyWith =>
      __$SetSelectedMovieCopyWithImpl<_SetSelectedMovie>(this, _$identity);
}

abstract class _SetSelectedMovie implements SetSelectedMovie {
  const factory _SetSelectedMovie(int movieId) = _$_SetSelectedMovie;

  @override
  int get movieId;
  @override
  _$SetSelectedMovieCopyWith<_SetSelectedMovie> get copyWith;
}
