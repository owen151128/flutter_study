import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_cat/features/home/models/cat_image_info.dart';
import 'package:random_cat/features/network/cat_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cat_images_notifier.g.dart';

@riverpod
class CatImagesNotifier extends _$CatImagesNotifier {
  @override
  Future<List<CatImageInfo>> build(int size) async {
    state = AsyncValue.loading();

    return load(size);
  }

  Future<List<CatImageInfo>> load(int size) async {
    final Dio dio = Dio();
    final CatRestClient catRestClient = CatRestClient(dio);

    return catRestClient.getCatImageInfo(size: size);
  }

  Future<void> loadCatImages(int size) async {
    state = AsyncValue.loading();
    state = AsyncValue.data(await load(size));
  }
}
