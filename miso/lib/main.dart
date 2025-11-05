import 'package:flutter/material.dart';
import 'package:miso/home_page.dart';

void main() {
  runApp(const MisoApp());
}

class MisoApp extends StatelessWidget {
  const MisoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}
