import 'package:flutter_course/src/epics/app_epics.dart';
import 'package:flutter_course/src/models/index.dart';
import 'package:flutter_course/src/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

Future<Store<AppState>> init() async {
  const AppEpics epic = AppEpics();

  return Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epic.epics),
    ],
  );
}
