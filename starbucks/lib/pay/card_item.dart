import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String cardImageUrl;

  const CardItem({super.key, required this.cardImageUrl});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(2),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          offset: Offset(0, 5),
          spreadRadius: 1,
          blurRadius: 6,
        ),
      ],
    ),
    child: Image.network(cardImageUrl),
  );
}
