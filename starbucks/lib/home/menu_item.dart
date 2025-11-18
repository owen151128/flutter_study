import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const MenuItem({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => {},
    borderRadius: BorderRadius.circular(20),
    child: SizedBox(
      width: 128,
      child: Stack(
        children: [
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          Positioned(
            top: 142,
            left: 1,
            right: 1,
            child: Text(
              name,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
