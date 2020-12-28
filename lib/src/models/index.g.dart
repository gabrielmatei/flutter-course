// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Photo> _$photoSerializer = new _$PhotoSerializer();
Serializer<PhotoUrls> _$photoUrlsSerializer = new _$PhotoUrlsSerializer();

class _$PhotoSerializer implements StructuredSerializer<Photo> {
  @override
  final Iterable<Type> types = const [Photo, _$Photo];
  @override
  final String wireName = 'Photo';

  @override
  Iterable<Object> serialize(Serializers serializers, Photo object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
      'height',
      serializers.serialize(object.height, specifiedType: const FullType(int)),
      'urls',
      serializers.serialize(object.urls, specifiedType: const FullType(PhotoUrls)),
    ];

    return result;
  }

  @override
  Photo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'width':
          result.width = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'height':
          result.height = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'urls':
          result.urls.replace(serializers.deserialize(value, specifiedType: const FullType(PhotoUrls)) as PhotoUrls);
          break;
      }
    }

    return result.build();
  }
}

class _$PhotoUrlsSerializer implements StructuredSerializer<PhotoUrls> {
  @override
  final Iterable<Type> types = const [PhotoUrls, _$PhotoUrls];
  @override
  final String wireName = 'PhotoUrls';

  @override
  Iterable<Object> serialize(Serializers serializers, PhotoUrls object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'thumb',
      serializers.serialize(object.thumb, specifiedType: const FullType(String)),
      'regular',
      serializers.serialize(object.regular, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PhotoUrls deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoUrlsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'thumb':
          result.thumb = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'regular':
          result.regular = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<Photo> photos;
  @override
  final int page;
  @override
  final String query;
  @override
  final String color;
  @override
  final bool isLoading;

  factory _$AppState([void Function(AppStateBuilder) updates]) => (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.photos, this.page, this.query, this.color, this.isLoading}) : super._() {
    if (photos == null) {
      throw new BuiltValueNullFieldError('AppState', 'photos');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('AppState', 'page');
    }
    if (query == null) {
      throw new BuiltValueNullFieldError('AppState', 'query');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('AppState', 'color');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        photos == other.photos &&
        page == other.page &&
        query == other.query &&
        color == other.color &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc($jc($jc(0, photos.hashCode), page.hashCode), query.hashCode), color.hashCode), isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('photos', photos)
          ..add('page', page)
          ..add('query', query)
          ..add('color', color)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<Photo> _photos;
  ListBuilder<Photo> get photos => _$this._photos ??= new ListBuilder<Photo>();
  set photos(ListBuilder<Photo> photos) => _$this._photos = photos;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _photos = _$v.photos?.toBuilder();
      _page = _$v.page;
      _query = _$v.query;
      _color = _$v.color;
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result =
          _$v ?? new _$AppState._(photos: photos.build(), page: page, query: query, color: color, isLoading: isLoading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'photos';
        photos.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Photo extends Photo {
  @override
  final String id;
  @override
  final int width;
  @override
  final int height;
  @override
  final PhotoUrls urls;

  factory _$Photo([void Function(PhotoBuilder) updates]) => (new PhotoBuilder()..update(updates)).build();

  _$Photo._({this.id, this.width, this.height, this.urls}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Photo', 'id');
    }
    if (width == null) {
      throw new BuiltValueNullFieldError('Photo', 'width');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('Photo', 'height');
    }
    if (urls == null) {
      throw new BuiltValueNullFieldError('Photo', 'urls');
    }
  }

  @override
  Photo rebuild(void Function(PhotoBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  PhotoBuilder toBuilder() => new PhotoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Photo && id == other.id && width == other.width && height == other.height && urls == other.urls;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), width.hashCode), height.hashCode), urls.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Photo')
          ..add('id', id)
          ..add('width', width)
          ..add('height', height)
          ..add('urls', urls))
        .toString();
  }
}

class PhotoBuilder implements Builder<Photo, PhotoBuilder> {
  _$Photo _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  PhotoUrlsBuilder _urls;
  PhotoUrlsBuilder get urls => _$this._urls ??= new PhotoUrlsBuilder();
  set urls(PhotoUrlsBuilder urls) => _$this._urls = urls;

  PhotoBuilder();

  PhotoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _width = _$v.width;
      _height = _$v.height;
      _urls = _$v.urls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Photo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Photo;
  }

  @override
  void update(void Function(PhotoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Photo build() {
    _$Photo _$result;
    try {
      _$result = _$v ?? new _$Photo._(id: id, width: width, height: height, urls: urls.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'urls';
        urls.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('Photo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PhotoUrls extends PhotoUrls {
  @override
  final String thumb;
  @override
  final String regular;

  factory _$PhotoUrls([void Function(PhotoUrlsBuilder) updates]) => (new PhotoUrlsBuilder()..update(updates)).build();

  _$PhotoUrls._({this.thumb, this.regular}) : super._() {
    if (thumb == null) {
      throw new BuiltValueNullFieldError('PhotoUrls', 'thumb');
    }
    if (regular == null) {
      throw new BuiltValueNullFieldError('PhotoUrls', 'regular');
    }
  }

  @override
  PhotoUrls rebuild(void Function(PhotoUrlsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  PhotoUrlsBuilder toBuilder() => new PhotoUrlsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoUrls && thumb == other.thumb && regular == other.regular;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, thumb.hashCode), regular.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhotoUrls')..add('thumb', thumb)..add('regular', regular)).toString();
  }
}

class PhotoUrlsBuilder implements Builder<PhotoUrls, PhotoUrlsBuilder> {
  _$PhotoUrls _$v;

  String _thumb;
  String get thumb => _$this._thumb;
  set thumb(String thumb) => _$this._thumb = thumb;

  String _regular;
  String get regular => _$this._regular;
  set regular(String regular) => _$this._regular = regular;

  PhotoUrlsBuilder();

  PhotoUrlsBuilder get _$this {
    if (_$v != null) {
      _thumb = _$v.thumb;
      _regular = _$v.regular;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhotoUrls other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhotoUrls;
  }

  @override
  void update(void Function(PhotoUrlsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhotoUrls build() {
    final _$result = _$v ?? new _$PhotoUrls._(thumb: thumb, regular: regular);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
