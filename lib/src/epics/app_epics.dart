import 'package:flutter_course/src/actions/index.dart';
import 'package:flutter_course/src/data/unsplash_api.dart';
import 'package:flutter_course/src/models/index.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({@required UnsplashApi unsplashApi})
      : assert(unsplashApi != null),
        _unsplashApi = unsplashApi;

  final UnsplashApi _unsplashApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetPhotosStart>(_getPhotosMiddleware),
    ]);
  }

  Stream<dynamic> _getPhotosMiddleware(Stream<GetPhotosStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((GetPhotosStart action) async => await _unsplashApi.getPhotos(
              action.query,
              action.page,
              action.color,
            ))
        .map((List<Photo> photos) => GetPhotos.successful(photos))
        .onErrorReturnWith((dynamic error) => GetPhotos.error(error));
  }
}
