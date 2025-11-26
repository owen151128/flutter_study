import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:random_cat/features/favorite/notifiers/cat_image_favorites_notifier.dart';
import 'package:random_cat/features/favorite/screens/favorite_screen.dart';
import 'package:random_cat/features/home/notifiers/cat_images_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = catImagesProvider(10);
    final catImageInfo = ref.watch(provider);
    final catImageInfoNotifier = ref.read(provider.notifier);
    final catImageFavorites = ref.watch(catImageFavoritesProvider);
    final catImageFavoritesNotifier = ref.read(
      catImageFavoritesProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text("랜덤 고양이"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoriteScreen()),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GridView.count(
          padding: EdgeInsets.all(8),
          crossAxisCount: 2,
          children: List.generate(
            10,
            (i) => catImageInfo.when(
              data: (data) => InkWell(
                onTap: () {
                  if (catImageFavorites.contains(data[i])) {
                    catImageFavoritesNotifier.remove(data[i]);
                  } else {
                    catImageFavoritesNotifier.add(data[i]);
                  }
                },
                borderRadius: BorderRadius.circular(10),
                splashColor: Colors.amberAccent,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(data[i].url ?? "", fit: BoxFit.cover),
                  ),
                ),
              ),
              error: (error, stackTrace) =>
                  getLoadingScreen(e: error, s: stackTrace),
              loading: () => getLoadingScreen(),
            ),
          ),
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
