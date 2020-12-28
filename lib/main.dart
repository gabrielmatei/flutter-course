import 'package:flutter/material.dart';
import 'package:flutter_course/src/actions/index.dart';
import 'package:flutter_course/src/data/unsplash_api.dart';
import 'package:flutter_course/src/epics/app_epics.dart';
import 'package:flutter_course/src/models/index.dart';
import 'package:flutter_course/src/presentation/home_page.dart';
import 'package:flutter_course/src/reducer/reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  final Client client = Client();
  final UnsplashApi api = UnsplashApi(client: client);
  final AppEpics epics = AppEpics(unsplashApi: api);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epics.epics),
    ],
  );

  store.dispatch(GetPhotos.start(initialState.query, initialState.page, initialState.color));

  runApp(App(store: store));
}

class App extends StatelessWidget {
  const App({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
