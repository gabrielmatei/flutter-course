import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/src/models/index.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class UnsplashApi {
  const UnsplashApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Photo>> getPhotos(String query, int page, String color) async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'api.unsplash.com',
      pathSegments: <String>['search', 'photos'],
      queryParameters: <String, String>{
        'query': query,
        'page': '$page',
        if (color != '') 'color': color,
      },
    );

    final Response response = await _client.get(
      url,
      headers: <String, String>{
        'Authorization': 'Client-ID JgbCdocq_HXwxf1ZPu7wdWfLMV1L0sYgAJHa9Q5E4us',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((dynamic json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}
