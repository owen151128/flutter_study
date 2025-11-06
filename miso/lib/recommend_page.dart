import 'package:flutter/material.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Text(
        "Recommend!",
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
