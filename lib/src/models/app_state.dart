part of models;

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState((AppStateBuilder builder) {
      builder
        ..isLoading = false
        ..page = 1
        ..query = ''
        ..color = '';
    });
  }

  AppState._();

  BuiltList<Photo> get photos;

  int get page;

  String get query;

  String get color;

  bool get isLoading;
}
