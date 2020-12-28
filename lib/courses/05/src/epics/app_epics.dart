import 'package:flutter_course/courses/05/src/actions/index.dart';
import 'package:flutter_course/courses/05/src/data/yts_api.dart';
import 'package:flutter_course/courses/05/src/models/index.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetMovieStart>(_getMoviesStart),
    ]);
  }

  Stream<dynamic> _getMoviesStart(Stream<GetMovieStart> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((GetMovieStart action) async => await _ytsApi.getMovies(
              store.state.nextPage,
              store.state.quality,
              store.state.genre,
              store.state.orderBy,
            ))
        .map((List<Movie> movies) => GetMovies.successful(movies))
        .onErrorReturnWith((dynamic error) => GetMovies.error(error));
  }
}
