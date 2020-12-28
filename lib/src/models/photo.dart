part of models;

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
