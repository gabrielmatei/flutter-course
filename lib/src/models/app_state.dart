library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'photo.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState((AppStateBuilder builder) {
      builder
        ..isLoading = false
        ..page = 1
        ..query = '';
    });
  }

  AppState._();

  BuiltList<Photo> get photos;

  int get page;

  String get query;

  bool get isLoading;
}
