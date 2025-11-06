import 'package:flutter/material.dart';
import 'package:miso/main_page.dart';

void main() {
  runApp(MisoApp());
}

class MisoApp extends StatelessWidget {
  MisoApp({super.key});

  final primaryColor = Color.fromARGB(255, 38, 103, 240);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
        ),
      ),
      home: MainPage(),
    );
  }
}
