import 'package:random_cat/features/home/models/cat_image_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cat_image_favorites_notifier.g.dart';

@riverpod
class CatImageFavoritesNotifier extends _$CatImageFavoritesNotifier {
  @override
  List<CatImageInfo> build() {
    return [];
  }

  void add(CatImageInfo catImageInfo) {
    state = [...state, catImageInfo];
  }

  void remove(CatImageInfo catImageInfo) {
    state.remove(catImageInfo);
    state = [...state];
  }
}
