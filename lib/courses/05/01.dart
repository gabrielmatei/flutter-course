import 'package:flutter/material.dart';
import 'package:flutter_course/courses/05/src/actions/get_movies.dart';
import 'package:flutter_course/courses/05/src/data/yts_api.dart';
import 'package:flutter_course/courses/05/src/middleware/app_middleware.dart';
import 'package:flutter_course/courses/05/src/models/app_state.dart';
import 'package:flutter_course/courses/05/src/presentation/home_page.dart';
import 'package:flutter_course/courses/05/src/presentation/movie_detail.dart';
import 'package:flutter_course/courses/05/src/reducer/reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';

void main() {
  final Client client = Client();
  final YtsApi api = YtsApi(client: client);
  final AppMiddleware appMiddleware = AppMiddleware(ytsApi: api);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: appMiddleware.middleware,
  );

  store.dispatch(const GetMovies());

  runApp(App(store: store));
}

class App extends StatelessWidget {
  const App({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Course',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: <String,WidgetBuilder>{
          '/movieDetail': (BuildContext context) => const MovieDetail() ,
        },
      ),
    );
  }
}
