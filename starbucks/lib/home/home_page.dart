import 'package:flutter/material.dart';
import 'package:starbucks/home/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeAppBar(
          appBarBackgroundImageUrl:
              "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-bg.png",
        ),
        SliverFillViewport(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) => Center(child: Text("Home Page!")),
          ),
        ),
      ],
    ),
  );
}
