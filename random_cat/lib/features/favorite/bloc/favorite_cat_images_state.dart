part of 'favorite_cat_images_bloc.dart';

@immutable
sealed class FavoriteCatImagesState {
  const FavoriteCatImagesState(this.favoriteCatImages);

  final List<CatImageInfo> favoriteCatImages;
}

final class FavoriteCatImagesInitial extends FavoriteCatImagesState {
  const FavoriteCatImagesInitial(super.favoriteCatImages);
}

final class FavoriteCatImagesLoading extends FavoriteCatImagesState {
  const FavoriteCatImagesLoading(super.favoriteCatImages);
}

final class FavoriteCatImagesError extends FavoriteCatImagesState {
  const FavoriteCatImagesError(
    super.favoriteCatImages,
    this.error,
    this.stackTrace,
  );

  final Object error;
  final StackTrace stackTrace;
}

final class FavoriteCatImagesLoaded extends FavoriteCatImagesState {
  const FavoriteCatImagesLoaded(super.favoriteCatImages);
}
