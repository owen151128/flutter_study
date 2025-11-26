import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:random_cat/features/favorite/screens/favorite_page.dart';
import 'package:random_cat/features/home/notifiers/cat_images_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = catImagesProvider(10);
    final catImageInfo = ref.watch(provider);
    final catImageInfoGetter = ref.read(provider.notifier);

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
              MaterialPageRoute(builder: (context) => FavoritePage()),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        crossAxisCount: 2,
        children: List.generate(
          10,
          (i) => catImageInfo.when(
            data: (data) => Image.network(data[i].url ?? "", fit: BoxFit.cover),
            error: (error, stackTrace) => getLoadingScreen(),
            loading: () => getLoadingScreen(),
          ),
        ),
      ),
    );
  }

  Widget getLoadingScreen() {
    return Center(child: CircularProgressIndicator(color: Colors.amber));
  }
}
