// GENERATED CODE - DO NOT MODIFY BY HAND

part of photo_urls;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhotoUrls> _$photoUrlsSerializer = new _$PhotoUrlsSerializer();

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
