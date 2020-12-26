library photo_urls;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_course/src/models/serializers.dart';

part 'photo_urls.g.dart';

abstract class PhotoUrls implements Built<PhotoUrls, PhotoUrlsBuilder> {
  factory PhotoUrls([void Function(PhotoUrlsBuilder b) updates]) = _$PhotoUrls;

  factory PhotoUrls.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  PhotoUrls._();

  String get thumb;

  String get regular;

  static Serializer<PhotoUrls> get serializer => _$photoUrlsSerializer;
}
