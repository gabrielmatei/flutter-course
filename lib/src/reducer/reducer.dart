import 'package:flutter_course/src/actions/index.dart';
import 'package:flutter_course/src/models/index.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetPhotosStart>(_getPhotosStart),
  TypedReducer<AppState, GetPhotosSuccessful>(_getPhotosSuccessful),
  TypedReducer<AppState, GetPhotosError>(_getPhotosError),
  TypedReducer<AppState, SetQuery>(_setQuery),
  TypedReducer<AppState, SetColor>(_setColor),
]);

AppState _getPhotosStart(AppState state, GetPhotosStart action) {
  return state.rebuild((AppStateBuilder b) => b.isLoading = true);
}

AppState _getPhotosSuccessful(AppState state, GetPhotosSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..photos.addAll(action.photos)
      ..isLoading = false
      ..page = b.page + 1;
  });
}

AppState _getPhotosError(AppState state, GetPhotosError action) {
  return state.rebuild((AppStateBuilder b) => b.isLoading = false);
}

AppState _setQuery(AppState state, SetQuery action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..query = action.query
      ..photos.clear();
  });
}

AppState _setColor(AppState state, SetColor action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..color = action.color
      ..photos.clear();
  });
}
