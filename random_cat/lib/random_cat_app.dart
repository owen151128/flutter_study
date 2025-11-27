import 'package:flutter/material.dart';

import 'features/home/views/home_page.dart';

class RandomCatApp extends StatelessWidget {
  const RandomCatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random cat app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: const HomePage(),
    );
  }
}
