import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat/features/favorite/bloc/favorite_cat_images_bloc.dart';
import 'package:random_cat/features/home/bloc/cat_image_infos_bloc.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => CatImageInfosBloc()),
      BlocProvider(create: (_) => FavoriteCatImagesBloc()),
    ],
    child: HomeView(),
  );
}
