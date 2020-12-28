// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
