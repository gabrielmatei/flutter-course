part of containers;

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
