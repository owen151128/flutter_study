import 'package:flutter/material.dart';
import 'package:starbucks/gift_page.dart';
import 'package:starbucks/home/home_page.dart';
import 'package:starbucks/more_page.dart';
import 'package:starbucks/order/order_page.dart';
import 'package:starbucks/pay/pay_page.dart';

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
      currentIndex: _currentIndex,
      onTap: (value) => setState(() => _currentIndex = value),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_rounded),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.free_breakfast), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ''),
      ],
    ),
    body: IndexedStack(
      index: _currentIndex,
      children: [HomePage(), PayPage(), OrderPage(), GiftPage(), MorePage()],
    ),
  );
}
