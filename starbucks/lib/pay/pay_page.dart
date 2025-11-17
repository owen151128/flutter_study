import 'package:flutter/material.dart';
import 'package:starbucks/pay/card_item.dart';

class PayPage extends StatelessWidget {
  /// 카드 이미지
  final String cardImageUrl =
      "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-card.png";

  const PayPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        "Pay",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.list_rounded, color: Colors.grey),
        ),
      ],
    ),
    body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Divider(height: 1),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: PageController(
                        viewportFraction: 0.85,
                      ), // 옆에 항목 살짝 보이게
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return CardItem(cardImageUrl: cardImageUrl);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => {},
                            child: Text(
                              "Coupon",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(height: 12, width: 1, color: Colors.grey),
                        Expanded(
                          child: TextButton(
                            onPressed: () => {},
                            child: Text(
                              "e-Gift Item",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
