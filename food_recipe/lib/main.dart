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
      home: const FoodRecipeHomePage(),
    );
  }
}

class FoodRecipeHomePage extends StatelessWidget {
  const FoodRecipeHomePage({super.key});

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
      body: Text("Hello World!"),
    );
  }
}
