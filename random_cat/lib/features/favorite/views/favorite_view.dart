import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat/features/favorite/bloc/favorite_cat_images_bloc.dart';
import 'package:random_cat/features/shared/network/models/cat_image_info.dart';
import 'package:random_cat/features/shared/widgets/common_widgets.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text("좋아요"),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: BlocConsumer<FavoriteCatImagesBloc, FavoriteCatImagesState>(
          builder: (context, state) {
            switch (state) {
              case FavoriteCatImagesLoaded():
                return gridWidget(context, state.favoriteCatImages);
              case FavoriteCatImagesError():
                return CommonWidgets.retryWidget(
                  context,
                  () => context.read<FavoriteCatImagesBloc>().add(
                    FavoriteCatImagesLoad(),
                  ),
                );
              default:
                return CommonWidgets.loadingWidget(context);
            }
          },
          listener: (context, state) {
            if (state is FavoriteCatImagesError) {
              CommonWidgets.showErrorDialog(
                context,
                state.error,
                state.stackTrace,
              );
            }
          },
        ),
      ),
    );
  }

  Widget gridWidget(
    BuildContext context,
    List<CatImageInfo> favoriteCatImages,
  ) {
    return GridView.count(
      padding: EdgeInsets.all(8),
      crossAxisCount: 2,
      children: List.generate(
        favoriteCatImages.length,
        (i) => InkWell(
          onTap: () {
            context.read<FavoriteCatImagesBloc>().add(
              FavoriteCatImagesRemove(catImageInfo: favoriteCatImages[i]),
            );
          },
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.amberAccent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      favoriteCatImages[i].url ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Icon(Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
