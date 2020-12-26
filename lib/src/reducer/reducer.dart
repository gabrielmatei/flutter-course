import 'package:flutter_course/src/actions/get_photos.dart';
import 'package:flutter_course/src/actions/set_color.dart';
import 'package:flutter_course/src/actions/set_query.dart';
import 'package:flutter_course/src/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  final AppStateBuilder builder = state.toBuilder();

  if (action is GetPhotosStart) {
    builder.isLoading = true;
  } else if (action is GetPhotosSuccessful) {
    builder
      ..photos.addAll(action.photos)
      ..isLoading = false
      ..page = builder.page + 1;
  } else if (action is GetPhotosError) {
    builder.isLoading = false;
  } else if (action is SetQuery) {
    builder
      ..query = action.query
      ..photos.clear();
  } else if (action is SetColor) {
    builder
      ..color = action.color
      ..photos.clear();
  }

  return builder.build();
}
