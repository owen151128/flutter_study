part of 'favorite_cat_images_bloc.dart';

@immutable
sealed class FavoriteCatImagesEvent {}

final class FavoriteCatImagesLoad extends FavoriteCatImagesEvent {}

final class FavoriteCatImagesAdd extends FavoriteCatImagesEvent {
  FavoriteCatImagesAdd({required this.catImageInfo});

  final CatImageInfo catImageInfo;
}

final class FavoriteCatImagesRemove extends FavoriteCatImagesEvent {
  FavoriteCatImagesRemove({required this.catImageInfo});

  final CatImageInfo catImageInfo;
}
