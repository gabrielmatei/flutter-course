// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of get_photos;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GetPhotosTearOff {
  const _$GetPhotosTearOff();

// ignore: unused_element
  GetPhotosStart start(String query, int page, String color) {
    return GetPhotosStart(
      query,
      page,
      color,
    );
  }

// ignore: unused_element
  GetPhotosSuccessful successful(List<Photo> photos) {
    return GetPhotosSuccessful(
      photos,
    );
  }

// ignore: unused_element
  GetPhotosError error(dynamic error) {
    return GetPhotosError(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GetPhotos = _$GetPhotosTearOff();

/// @nodoc
mixin _$GetPhotos {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult start(String query, int page, String color),
    @required TResult successful(List<Photo> photos),
    @required TResult error(dynamic error),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult start(String query, int page, String color),
    TResult successful(List<Photo> photos),
    TResult error(dynamic error),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult start(GetPhotosStart value),
    @required TResult successful(GetPhotosSuccessful value),
    @required TResult error(GetPhotosError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult start(GetPhotosStart value),
    TResult successful(GetPhotosSuccessful value),
    TResult error(GetPhotosError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $GetPhotosCopyWith<$Res> {
  factory $GetPhotosCopyWith(GetPhotos value, $Res Function(GetPhotos) then) = _$GetPhotosCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetPhotosCopyWithImpl<$Res> implements $GetPhotosCopyWith<$Res> {
  _$GetPhotosCopyWithImpl(this._value, this._then);

  final GetPhotos _value;
  // ignore: unused_field
  final $Res Function(GetPhotos) _then;
}

/// @nodoc
abstract class $GetPhotosStartCopyWith<$Res> {
  factory $GetPhotosStartCopyWith(GetPhotosStart value, $Res Function(GetPhotosStart) then) =
      _$GetPhotosStartCopyWithImpl<$Res>;
  $Res call({String query, int page, String color});
}

/// @nodoc
class _$GetPhotosStartCopyWithImpl<$Res> extends _$GetPhotosCopyWithImpl<$Res>
    implements $GetPhotosStartCopyWith<$Res> {
  _$GetPhotosStartCopyWithImpl(GetPhotosStart _value, $Res Function(GetPhotosStart) _then)
      : super(_value, (v) => _then(v as GetPhotosStart));

  @override
  GetPhotosStart get _value => super._value as GetPhotosStart;

  @override
  $Res call({
    Object query = freezed,
    Object page = freezed,
    Object color = freezed,
  }) {
    return _then(GetPhotosStart(
      query == freezed ? _value.query : query as String,
      page == freezed ? _value.page : page as int,
      color == freezed ? _value.color : color as String,
    ));
  }
}

/// @nodoc
class _$GetPhotosStart implements GetPhotosStart {
  const _$GetPhotosStart(this.query, this.page, this.color)
      : assert(query != null),
        assert(page != null),
        assert(color != null);

  @override
  final String query;
  @override
  final int page;
  @override
  final String color;

  @override
  String toString() {
    return 'GetPhotos.start(query: $query, page: $page, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPhotosStart &&
            (identical(other.query, query) || const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.page, page) || const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.color, color) || const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(color);

  @override
  $GetPhotosStartCopyWith<GetPhotosStart> get copyWith =>
      _$GetPhotosStartCopyWithImpl<GetPhotosStart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult start(String query, int page, String color),
    @required TResult successful(List<Photo> photos),
    @required TResult error(dynamic error),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return start(query, page, color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult start(String query, int page, String color),
    TResult successful(List<Photo> photos),
    TResult error(dynamic error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (start != null) {
      return start(query, page, color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult start(GetPhotosStart value),
    @required TResult successful(GetPhotosSuccessful value),
    @required TResult error(GetPhotosError value),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult start(GetPhotosStart value),
    TResult successful(GetPhotosSuccessful value),
    TResult error(GetPhotosError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class GetPhotosStart implements GetPhotos {
  const factory GetPhotosStart(String query, int page, String color) = _$GetPhotosStart;

  String get query;
  int get page;
  String get color;
  $GetPhotosStartCopyWith<GetPhotosStart> get copyWith;
}

/// @nodoc
abstract class $GetPhotosSuccessfulCopyWith<$Res> {
  factory $GetPhotosSuccessfulCopyWith(GetPhotosSuccessful value, $Res Function(GetPhotosSuccessful) then) =
      _$GetPhotosSuccessfulCopyWithImpl<$Res>;
  $Res call({List<Photo> photos});
}

/// @nodoc
class _$GetPhotosSuccessfulCopyWithImpl<$Res> extends _$GetPhotosCopyWithImpl<$Res>
    implements $GetPhotosSuccessfulCopyWith<$Res> {
  _$GetPhotosSuccessfulCopyWithImpl(GetPhotosSuccessful _value, $Res Function(GetPhotosSuccessful) _then)
      : super(_value, (v) => _then(v as GetPhotosSuccessful));

  @override
  GetPhotosSuccessful get _value => super._value as GetPhotosSuccessful;

  @override
  $Res call({
    Object photos = freezed,
  }) {
    return _then(GetPhotosSuccessful(
      photos == freezed ? _value.photos : photos as List<Photo>,
    ));
  }
}

/// @nodoc
class _$GetPhotosSuccessful implements GetPhotosSuccessful {
  const _$GetPhotosSuccessful(this.photos) : assert(photos != null);

  @override
  final List<Photo> photos;

  @override
  String toString() {
    return 'GetPhotos.successful(photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPhotosSuccessful &&
            (identical(other.photos, photos) || const DeepCollectionEquality().equals(other.photos, photos)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(photos);

  @override
  $GetPhotosSuccessfulCopyWith<GetPhotosSuccessful> get copyWith =>
      _$GetPhotosSuccessfulCopyWithImpl<GetPhotosSuccessful>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult start(String query, int page, String color),
    @required TResult successful(List<Photo> photos),
    @required TResult error(dynamic error),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return successful(photos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult start(String query, int page, String color),
    TResult successful(List<Photo> photos),
    TResult error(dynamic error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful(photos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult start(GetPhotosStart value),
    @required TResult successful(GetPhotosSuccessful value),
    @required TResult error(GetPhotosError value),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult start(GetPhotosStart value),
    TResult successful(GetPhotosSuccessful value),
    TResult error(GetPhotosError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class GetPhotosSuccessful implements GetPhotos {
  const factory GetPhotosSuccessful(List<Photo> photos) = _$GetPhotosSuccessful;

  List<Photo> get photos;
  $GetPhotosSuccessfulCopyWith<GetPhotosSuccessful> get copyWith;
}

/// @nodoc
abstract class $GetPhotosErrorCopyWith<$Res> {
  factory $GetPhotosErrorCopyWith(GetPhotosError value, $Res Function(GetPhotosError) then) =
      _$GetPhotosErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class _$GetPhotosErrorCopyWithImpl<$Res> extends _$GetPhotosCopyWithImpl<$Res>
    implements $GetPhotosErrorCopyWith<$Res> {
  _$GetPhotosErrorCopyWithImpl(GetPhotosError _value, $Res Function(GetPhotosError) _then)
      : super(_value, (v) => _then(v as GetPhotosError));

  @override
  GetPhotosError get _value => super._value as GetPhotosError;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(GetPhotosError(
      error == freezed ? _value.error : error as dynamic,
    ));
  }
}

/// @nodoc
class _$GetPhotosError implements GetPhotosError {
  const _$GetPhotosError(this.error) : assert(error != null);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'GetPhotos.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetPhotosError &&
            (identical(other.error, error) || const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $GetPhotosErrorCopyWith<GetPhotosError> get copyWith =>
      _$GetPhotosErrorCopyWithImpl<GetPhotosError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult start(String query, int page, String color),
    @required TResult successful(List<Photo> photos),
    @required TResult error(dynamic error),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult start(String query, int page, String color),
    TResult successful(List<Photo> photos),
    TResult error(dynamic error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult start(GetPhotosStart value),
    @required TResult successful(GetPhotosSuccessful value),
    @required TResult error(GetPhotosError value),
  }) {
    assert(start != null);
    assert(successful != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult start(GetPhotosStart value),
    TResult successful(GetPhotosSuccessful value),
    TResult error(GetPhotosError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetPhotosError implements GetPhotos {
  const factory GetPhotosError(dynamic error) = _$GetPhotosError;

  dynamic get error;
  $GetPhotosErrorCopyWith<GetPhotosError> get copyWith;
}
