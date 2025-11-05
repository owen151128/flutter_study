import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "https://devclass.devstory.co.kr/flutter-basic/2/insta-cat1.jpg",
      "https://devclass.devstory.co.kr/flutter-basic/2/insta-cat2.jpg",
      "https://devclass.devstory.co.kr/flutter-basic/2/insta-cat3.jpg",
      "https://devclass.devstory.co.kr/flutter-basic/2/insta-cat4.jpg",
      "https://devclass.devstory.co.kr/flutter-basic/2/insta-cat5.jpg",
      "https://devclass.devstory.co.kr/flutter-basic/2/insta-cat6.jpg",
      "https://devclass.devstory.co.kr/flutter-basic/2/insta-cat7.gif",
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.camera, color: Colors.black),
          onPressed: () {},
        ),
        title: Image.asset("assets/logo.png", height: 32),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.paperplane, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) => Feed(imageUrl: images[index]),
      ),
    );
  }
}
