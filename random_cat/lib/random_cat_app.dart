import 'package:flutter/material.dart';
import 'package:random_cat/features/home/screens/home_screen.dart';

class RandomCatApp extends StatelessWidget {
  const RandomCatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random cat app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}
