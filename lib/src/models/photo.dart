library photo;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_course/src/models/photo_urls.dart';
import 'package:flutter_course/src/models/serializers.dart';

part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {
  factory Photo([void Function(PhotoBuilder b) updates]) = _$Photo;

  factory Photo.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  Photo._();

  String get id;

  int get width;

  int get height;

  PhotoUrls get urls;

  static Serializer<Photo> get serializer => _$photoSerializer;
}
