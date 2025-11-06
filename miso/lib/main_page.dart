import 'package:flutter/material.dart';
import 'package:miso/home_page.dart';
import 'package:miso/recommend_page.dart';
import 'package:miso/reservation_page.dart';
import 'package:miso/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentIndex,
      onTap: (value) => setState(() => _currentIndex = value),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    ),
    body: IndexedStack(
      index: _currentIndex,
      children: [
        HomePage(),
        ReservationPage(),
        RecommendPage(),
        SettingsPage(),
      ],
    ),
  );
}
