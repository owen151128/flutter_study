import 'package:flutter/material.dart';
import 'package:starbucks/home/home_app_bar.dart';
import 'package:starbucks/home/menu_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// 추천 메뉴
  final List<Map<String, String>> menus = const [
    {
      "name": "돌체쿠키라떼",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu1.jpg",
    },
    {
      "name": "아이스 홀리데이 돌체 쿠키 라떼",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu2.jpg",
    },
    {
      "name": "스노우 민트 초콜릿",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu3.jpg",
    },
    {
      "name": "아이스 스노우 민트 초콜릿",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu4.jpg",
    },
    {
      "name": "스노우 민트 초콜릿 블렌디드",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu5.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () => {},
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(64)),
      label: Row(
        children: [
          Text(
            "Delivery",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.pedal_bike, color: Colors.white),
        ],
      ),
    ),
    body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeAppBar(
          appBarBackgroundImageUrl:
              "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-bg.png",
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-frequency.png",
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "김철수",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  TextSpan(text: " 님을 위한 추천 메뉴"),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 182,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  final String name =
                      menus[index % menus.length]["name"] ?? "오류";
                  final String imageUrl =
                      menus[index % menus.length]["imgUrl"] ?? "오류";

                  return MenuItem(name: name, imageUrl: imageUrl);
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-christmas.jpg",
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
