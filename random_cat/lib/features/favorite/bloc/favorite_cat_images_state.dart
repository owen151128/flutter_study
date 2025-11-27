part of 'favorite_cat_images_bloc.dart';

@immutable
sealed class FavoriteCatImagesState {}

final class FavoriteCatImagesInitial extends FavoriteCatImagesState {}

final class FavoriteCatImagesLoading extends FavoriteCatImagesState {}

final class FavoriteCatImagesError extends FavoriteCatImagesState {
  FavoriteCatImagesError({required this.error, required this.stackTrace});

  final Object error;
  final StackTrace stackTrace;
}

final class FavoriteCatImagesLoaded extends FavoriteCatImagesState {
  FavoriteCatImagesLoaded({required this.favoriteCatImages});

  final List<CatImageInfo> favoriteCatImages;
}
