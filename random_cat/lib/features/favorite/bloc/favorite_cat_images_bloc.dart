import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_cat/features/shared/network/models/cat_image_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_cat_images_event.dart';
part 'favorite_cat_images_state.dart';

class FavoriteCatImagesBloc
    extends Bloc<FavoriteCatImagesEvent, FavoriteCatImagesState> {
  FavoriteCatImagesBloc() : super(FavoriteCatImagesInitial()) {
    on<FavoriteCatImagesLoad>(onFavoriteCatImagesLoad);
    on<FavoriteCatImagesAdd>(onFavoriteCatImagesAdd);
    on<FavoriteCatImagesRemove>(onFavoriteCatImagesRemove);
    add(FavoriteCatImagesLoad());
  }

  static const String sharedPreferenceKey = "favorite_cat_images_string_list";

  List<CatImageInfo> get favoriteCatImages {
    if (state is! FavoriteCatImagesLoaded) {
      return [];
    }

    return (state as FavoriteCatImagesLoaded).favoriteCatImages ?? [];
  }

  Future<void> onFavoriteCatImagesLoad(
    FavoriteCatImagesLoad event,
    Emitter<FavoriteCatImagesState> emit,
  ) async {
    try {
      emit(FavoriteCatImagesLoading());
      emit(
        FavoriteCatImagesLoaded(
          favoriteCatImages: await _loadLocalFavoriteCatImages(),
        ),
      );
    } catch (e, st) {
      emit(FavoriteCatImagesError(error: e, stackTrace: st));
    }
  }

  Future<void> onFavoriteCatImagesAdd(
    FavoriteCatImagesAdd event,
    Emitter<FavoriteCatImagesState> emit,
  ) async {
    try {
      final List<CatImageInfo> added = [
        ...favoriteCatImages,
        event.catImageInfo,
      ];
      await _saveLocalFavoriteCatImages(added);
      emit(FavoriteCatImagesLoaded(favoriteCatImages: added));
    } catch (e, st) {
      emit(FavoriteCatImagesError(error: e, stackTrace: st));
    }
  }

  Future<void> onFavoriteCatImagesRemove(
    FavoriteCatImagesRemove event,
    Emitter<FavoriteCatImagesState> emit,
  ) async {
    try {
      favoriteCatImages.remove(event.catImageInfo);
      final List<CatImageInfo> removed = [...favoriteCatImages];
      await _saveLocalFavoriteCatImages(removed);
      emit(FavoriteCatImagesLoaded(favoriteCatImages: removed));
    } catch (e, st) {
      emit(FavoriteCatImagesError(error: e, stackTrace: st));
    }
  }

  Future<List<CatImageInfo>> _loadLocalFavoriteCatImages() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    List<String> encoded =
        sharedPreferences.getStringList(sharedPreferenceKey) ?? [];

    return encoded.map((s) => CatImageInfo.fromJson(jsonDecode(s))).toList();
  }

  Future<void> _saveLocalFavoriteCatImages(
    List<CatImageInfo> favoriteCatImages,
  ) async {
    List<String> encoded = favoriteCatImages
        .map((e) => jsonEncode(e.toJson()))
        .toList();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setStringList(sharedPreferenceKey, encoded);
  }
}
