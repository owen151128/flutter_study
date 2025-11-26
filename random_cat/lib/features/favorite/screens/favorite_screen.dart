import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:random_cat/features/favorite/notifiers/cat_image_favorites_notifier.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catImageFavorites = ref.watch(catImageFavoritesProvider);
    final catImageFavoritesNotifier = ref.read(
      catImageFavoritesProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text("좋아요"),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: GridView.count(
          padding: EdgeInsets.all(8),
          crossAxisCount: 2,
          children: List.generate(
            catImageFavorites.length,
            (i) => InkWell(
              onTap: () {
                if (catImageFavorites.contains(catImageFavorites[i])) {
                  catImageFavoritesNotifier.remove(catImageFavorites[i]);
                } else {
                  catImageFavoritesNotifier.add(catImageFavorites[i]);
                }
              },
              borderRadius: BorderRadius.circular(10),
              splashColor: Colors.amberAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    catImageFavorites[i].url ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // children: [
          //   ...catImageFavorites.when(
          //     data: (data) => List.generate(
          //       favoritesCatImageInfo.length,
          //       (i) => InkWell(
          //         onTap: () => catImageInfoNotifier.toggleFavorites(
          //           favoritesCatImageInfo[i],
          //         ),
          //         borderRadius: BorderRadius.circular(10),
          //         splashColor: Colors.amberAccent,
          //         child: Padding(
          //           padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(10),
          //             child: Image.network(
          //               favoritesCatImageInfo[i].url ?? "",
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ).toList(),
          //     error: (error, stackTrace) => [
          //       getLoadingScreen(e: error, s: stackTrace),
          //     ],
          //     loading: () => [getLoadingScreen()],
          //   ),
          // ],
        ),
      ),
    );
  }

  Widget getLoadingScreen({Object? e, StackTrace? s}) {
    if (e != null) {
      Logger().e(e);
      Logger().e(s);
    }

    return Center(child: CircularProgressIndicator(color: Colors.amber));
  }
}
