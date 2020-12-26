import 'package:flutter/material.dart';
import 'package:flutter_course/courses/05/src/models/app_state.dart';
import 'package:flutter_course/courses/05/src/models/movie.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({
    Key key,
    @required this.builder,
  }) : super(key: key);

  final ViewModelBuilder<Movie> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Movie>(
      converter: (Store<AppState> store) =>
          store.state.movies.firstWhere((Movie movie) => movie.id == store.state.selectedMovie),
      builder: builder,
    );
  }
}
