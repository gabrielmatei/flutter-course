part of models;

abstract class PhotoUrls implements Built<PhotoUrls, PhotoUrlsBuilder> {
  factory PhotoUrls([void Function(PhotoUrlsBuilder b) updates]) = _$PhotoUrls;

  factory PhotoUrls.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  PhotoUrls._();

  String get thumb;

  String get regular;

  static Serializer<PhotoUrls> get serializer => _$photoUrlsSerializer;
}
