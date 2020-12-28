part of actions;

@freezed
abstract class GetPhotos with _$GetPhotos {
  const factory GetPhotos.start(String query, int page, String color) = GetPhotosStart;

  const factory GetPhotos.successful(List<Photo> photos) = GetPhotosSuccessful;

  const factory GetPhotos.error(dynamic error) = GetPhotosError;
}
