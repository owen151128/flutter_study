import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("좋아요"),
      foregroundColor: Colors.white,
      backgroundColor: Colors.amber,
      centerTitle: true,
    ),
  );
}
