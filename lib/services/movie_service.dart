import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie.dart';

class MovieService {
  static const String _url = 'yts.mx';
  static const String _resource = '/api/v2/list_movies.json';

  Map<String, bool> getQualityFilters() => <String, bool>{
        '720p': false,
        '1080p': false,
        '2160p': false,
        '3D': false,
      };

  List<String> getGenreFilters() => <String>[
        'Action',
        'Adventure',
        'Animation',
        'Biography',
        'Comedy',
        'Crime',
        'Documentary',
        'Drama',
        'Family',
        'Fantasy',
        'Film Noir',
        'History',
        'Horror',
        'Music',
        'Musical',
        'Mystery',
        'Romance',
        'Sci-Fi',
        'Short Film',
        'Sport',
        'Superhero',
        'Thriller',
        'War',
        'Western',
      ];

  Future<List<Movie>> getMovies(Map<String, bool> quality, String genre, double minimumRating) async {
    final List<Movie> movies = <Movie>[];

    final Uri uri = Uri.https(_url, _resource, <String, String>{
      'quality': quality.keys.map((String key) => quality[key] ? key : '').toList().join(''),
      'genre': genre,
      'minimum_rating': '${minimumRating * 2}',
    });

    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> moviesData = jsonData['data']['movies'];
      for (final dynamic movieData in moviesData) {
        movies.add(Movie.fromJson(movieData));
      }
    }

    return movies;
  }
}
