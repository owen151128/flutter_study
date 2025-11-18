import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(const BucketListApp());
}

class BucketListApp extends StatelessWidget {
  const BucketListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bucket list',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
