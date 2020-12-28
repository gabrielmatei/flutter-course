part of actions;

@freezed
abstract class GetMovies with _$GetMovies {
  const factory GetMovies() = GetMovieStart;

  const factory GetMovies.successful(List<Movie> movies) = GetMoviesSuccessful;

  const factory GetMovies.error(dynamic error) = GetMoviesError;
}
