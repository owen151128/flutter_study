import 'package:flutter/material.dart';
import 'package:starbucks/main_page.dart';

void main() {
  runApp(StarbucksApp());
}

class StarbucksApp extends StatelessWidget {
  StarbucksApp({super.key});

  final Color _starbucksPrimaryColor = Color.fromARGB(255, 83, 184, 138);
  final Color _starbucksAccentColor = Color.fromARGB(255, 199, 176, 121);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starbucks App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _starbucksPrimaryColor,
          primary: _starbucksPrimaryColor,
          secondary: _starbucksAccentColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
