library movie;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_course/courses/05/src/models/serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void Function(MovieBuilder b) updates]) = _$Movie;

  factory Movie.from(dynamic json) {
    return serializers.deserializeWith(serializer, json);
  }

  Movie._();

  int get id;

  String get url;

  String get title;

  int get year;

  num get rating;

  int get runtime;

  String get summary;

  @BuiltValueField(wireName: 'background_image')
  String get background;

  @BuiltValueField(wireName: 'medium_cover_image')
  String get mediumCover;

  @BuiltValueField(wireName: 'large_cover_image')
  String get largeCover;

  static Serializer<Movie> get serializer => _$movieSerializer;
}
