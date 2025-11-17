import 'package:flutter/material.dart';
import 'package:starbucks/order/menu_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  /// 전체 메뉴
  final List<Map<String, String>> menus = const [
    {
      "ko": "추천",
      "en": "Recommend",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu1.jpg",
    },
    {
      "ko": "리저브 에스프레소",
      "en": "Reserve Espresso",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu2.jpg",
    },
    {
      "ko": "리저브 드립",
      "en": "Reserve Drip",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu3.jpg",
    },
    {
      "ko": "콜드브루",
      "en": "ColdBrew",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu4.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.search_outlined)),
        ],
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          tabs: [
            Tab(text: "전체 메뉴"),
            Tab(text: "나만의 메뉴"),
            Tab(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Transform.translate(
                    offset: Offset(0, -2),
                    child: Icon(Icons.cake, color: Colors.black),
                  ),
                  SizedBox(width: 4),
                  Text("홀케이크"),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          children: [
            ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                final Map<String, String> menu = menus[index % menus.length];
                final String title = menu["ko"] ?? "불러오기 실패";
                final String description = menu["en"] ?? "Load failed";
                final String imageUrl = menu["imgUrl"] ?? "";
                return MenuItem(
                  title: title,
                  description: description,
                  imageUrl: imageUrl,
                );
              },
            ),
            Center(child: Text("나만의 메뉴")),
            Center(child: Text("홀케이크")),
          ],
        ),
      ),
    ),
  );
}
