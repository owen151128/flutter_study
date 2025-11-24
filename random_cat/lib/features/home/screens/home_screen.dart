import 'package:flutter/material.dart';
import 'package:random_cat/features/favorite/screens/favorite_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
        (index) =>
            Center(child: Text("$index", style: TextStyle(fontSize: 24))),
      ),
    ),
  );
}
