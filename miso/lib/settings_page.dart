import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Text(
        "Settings!",
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
