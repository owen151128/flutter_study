import 'package:flutter/material.dart';
import 'package:one_line_diary/features/main/screens/main_screen.dart';

class OneLineDiaryApp extends StatelessWidget {
  const OneLineDiaryApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "One line diary",
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
    home: const MainScreen(),
  );
}
