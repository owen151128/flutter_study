import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(centerTitle: true, title: Text("Home")),
    body: Center(
      child: Text(
        "Hello!",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
      ),
    ),
  );
}
