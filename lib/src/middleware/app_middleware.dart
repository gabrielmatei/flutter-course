import 'package:flutter_course/src/actions/get_photos.dart';
import 'package:flutter_course/src/data/unsplash_api.dart';
import 'package:flutter_course/src/models/app_state.dart';
import 'package:flutter_course/src/models/photo.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({@required UnsplashApi unsplashApi})
      : assert(unsplashApi != null),
        _unsplashApi = unsplashApi;

  final UnsplashApi _unsplashApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      _getPhotosMiddleware,
    ];
  }

  Future<void> _getPhotosMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    if (action is! GetPhotosStart) {
      return;
    }

    try {
      final GetPhotosStart startAction = action as GetPhotosStart;
      final List<Photo> photos = await _unsplashApi.getPhotos(
        startAction.query,
        startAction.page,
        startAction.color,
      );
      final GetPhotos successful = GetPhotos.successful(photos);
      store.dispatch(successful);
    } catch (e) {
      final GetPhotos error = GetPhotos.error(e);
      store.dispatch(error);
    }
  }
}
