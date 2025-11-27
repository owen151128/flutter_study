import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:random_cat/features/shared/network/models/cat_image_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_cat_images_event.dart';
part 'favorite_cat_images_state.dart';

class FavoriteCatImagesBloc
    extends Bloc<FavoriteCatImagesEvent, FavoriteCatImagesState> {
  FavoriteCatImagesBloc() : super(FavoriteCatImagesInitial([])) {
    on<FavoriteCatImagesLoad>(onFavoriteCatImagesLoad);
    on<FavoriteCatImagesAdd>(onFavoriteCatImagesAdd);
    on<FavoriteCatImagesRemove>(onFavoriteCatImagesRemove);
    add(FavoriteCatImagesLoad());
  }

  static const String sharedPreferenceKey = "favorite_cat_images_string_list";

  Future<void> onFavoriteCatImagesLoad(
    FavoriteCatImagesLoad event,
    Emitter<FavoriteCatImagesState> emit,
  ) async {
    try {
      emit(FavoriteCatImagesLoading([]));
      emit(FavoriteCatImagesLoaded(await _loadLocalFavoriteCatImages()));
    } catch (e, st) {
      emit(FavoriteCatImagesError([], e, st));
    }
  }

  Future<void> onFavoriteCatImagesAdd(
    FavoriteCatImagesAdd event,
    Emitter<FavoriteCatImagesState> emit,
  ) async {
    try {
      final List<CatImageInfo> added = [
        ...state.favoriteCatImages,
        event.catImageInfo,
      ];
      await _saveLocalFavoriteCatImages(added);
      emit(FavoriteCatImagesLoaded(added));
    } catch (e, st) {
      emit(FavoriteCatImagesError([], e, st));
    }
  }

  Future<void> onFavoriteCatImagesRemove(
    FavoriteCatImagesRemove event,
    Emitter<FavoriteCatImagesState> emit,
  ) async {
    try {
      final List<CatImageInfo> removed = [...state.favoriteCatImages];
      removed.remove(event.catImageInfo);
      await _saveLocalFavoriteCatImages(removed);
      emit(FavoriteCatImagesLoaded(removed));
    } catch (e, st) {
      emit(FavoriteCatImagesError([], e, st));
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
