import 'package:meta/meta.dart';

class Movie {
  Movie({
    @required this.id,
    @required this.title,
    @required this.cover,
    @required this.rating,
    @required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      cover: json['medium_cover_image'],
      rating: double.parse(json['rating'].toString()),
      genres: List<String>.from(json['genres']),
    );
  }

  final int id;
  final String title;
  final String cover;
  final double rating;
  final List<String> genres;
}
