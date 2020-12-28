import 'dart:convert';

import 'package:flutter_course/courses/05/src/models/index.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class YtsApi {
  const YtsApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Movie>> getMovies(int page, String quality, String genre, String orderBy) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'yts.mx',
      pathSegments: <String>['api', 'v2', 'list_movies.json'],
      queryParameters: <String, String>{
        'limit': '20',
        'page': '$page',
        if (quality != null) 'quality': quality,
        if (genre != null) 'genre': genre,
        'order_by': orderBy,
      },
    );

    final Response response = await _client.get(uri);
    final List<dynamic> data = jsonDecode(response.body)['data']['movies'];
    return data.map((dynamic json) => Movie.from(json)).toList();
  }
}
