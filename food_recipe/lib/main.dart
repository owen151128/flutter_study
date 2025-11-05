import 'package:flutter/material.dart';

void main() {
  runApp(const FoodRecipeApp());
}

class FoodRecipeApp extends StatelessWidget {
  const FoodRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FoodRecipeHomePage(),
    );
  }
}

class FoodRecipeHomePage extends StatelessWidget {
  FoodRecipeHomePage({super.key});

  List<Map<String, dynamic>> dataList = [
    {
      "category": "수제버거",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/1/food-burger.jpg",
    },
    {
      "category": "건강식",
      "imgUrl": "https://devclass.devstory.co.kr/flutter-basic/1/food-soup.jpg",
    },
    {
      "category": "한식",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/1/food-korean-meals.jpg",
    },
    {
      "category": "디저트",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/1/food-tiramisu.jpg",
    },
    {
      "category": "피자",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/1/food-pizza.jpg",
    },
    {
      "category": "볶음밥",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/1/food-pizza.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Recipe",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            );
          },
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => print("go my page"),
                icon: Icon(Icons.person_outline),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.network(
                          "https://devclass.devstory.co.kr/flutter-basic/1/cat.png",
                          width: 62,
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      "닉네임",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "hello@world.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 12 / 4, // 가로 : 세로 = 12 : 4 (이미지를 12:4로 준비했어요)
              child: PageView(
                children: [
                  Image.network(
                    "https://devclass.devstory.co.kr/flutter-basic/1/sale-event-banner1.jpg",
                  ),
                  Image.network(
                    "https://devclass.devstory.co.kr/flutter-basic/1/sale-event-banner2.jpg",
                  ),
                  Image.network(
                    "https://devclass.devstory.co.kr/flutter-basic/1/sale-event-banner3.jpg",
                  ),
                  Image.network(
                    "https://devclass.devstory.co.kr/flutter-basic/1/sale-event-banner4.jpg",
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("구매내역", style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text("저장한 레시피", style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "상품을 검색해주세요.",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = dataList[index];
                String category = data["category"];
                String imageUrl = data["imgUrl"];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                      Text(
                        category,
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
