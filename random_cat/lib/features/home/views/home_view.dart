import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat/features/favorite/bloc/favorite_cat_images_bloc.dart';
import 'package:random_cat/features/favorite/views/favorite_page.dart';
import 'package:random_cat/features/home/bloc/cat_image_infos_bloc.dart';
import 'package:random_cat/features/shared/network/models/cat_image_info.dart';

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
              MaterialPageRoute(builder: (context) => FavoritePage()),
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
                return retryWidget(context);
              default:
                return loadingWidget(context);
            }
          },
          listener: (context, state) {
            if (state is CatImageInfosError) {
              showErrorDialog(context, state.error, state.stackTrace);
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

  Widget loadingWidget(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.07,
          height: MediaQuery.of(context).size.height * 0.07,
          child: CircularProgressIndicator(color: Colors.amberAccent),
        ),
        SizedBox(height: 20),
        Text(
          "로딩중...",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
      ],
    ),
  );

  Widget retryWidget(BuildContext context) => Center(
    child: TextButton(
      onPressed: () =>
          context.read<CatImageInfosBloc>().add(CatImageInfosLoad()),
      child: Text("재시도", style: TextStyle(fontSize: 32)),
    ),
  );

  void showErrorDialog(
    BuildContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("오류"),
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text("$error\n$stackTrace"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }
}
