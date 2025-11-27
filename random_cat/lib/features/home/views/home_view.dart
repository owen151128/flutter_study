import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat/features/favorite/bloc/favorite_cat_images_bloc.dart';
import 'package:random_cat/features/favorite/views/favorite_view.dart';
import 'package:random_cat/features/home/bloc/cat_image_infos_bloc.dart';
import 'package:random_cat/features/shared/network/models/cat_image_info.dart';
import 'package:random_cat/features/shared/widgets/common_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute(builder: (context) => FavoriteView()),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<CatImageInfosBloc, CatImageInfosState>(
          builder: (context, state) {
            switch (state) {
              case CatImageInfosLoaded():
                return gridWidget(context, state.catImageInfos);
              case CatImageInfosError():
                return CommonWidgets.retryWidget(
                  context,
                  () => context.read<CatImageInfosBloc>().add(
                    CatImageInfosLoad(),
                  ),
                );
              default:
                return CommonWidgets.loadingWidget(context);
            }
          },
          listener: (context, state) {
            if (state is CatImageInfosError) {
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

  Widget gridWidget(BuildContext context, List<CatImageInfo> catImageInfos) {
    return GridView.count(
      padding: EdgeInsets.all(8),
      crossAxisCount: 2,
      children: List.generate(
        catImageInfos.length,
        (i) => InkWell(
          onTap: () {
            if (context
                .read<FavoriteCatImagesBloc>()
                .state
                .favoriteCatImages
                .contains(catImageInfos[i])) {
              context.read<FavoriteCatImagesBloc>().add(
                FavoriteCatImagesRemove(catImageInfo: catImageInfos[i]),
              );
            } else {
              context.read<FavoriteCatImagesBloc>().add(
                FavoriteCatImagesAdd(catImageInfo: catImageInfos[i]),
              );
            }
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
                      catImageInfos[i].url ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child:
                        context
                            .watch<FavoriteCatImagesBloc>()
                            .state
                            .favoriteCatImages
                            .contains(catImageInfos[i])
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_outline, color: Colors.red),
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
