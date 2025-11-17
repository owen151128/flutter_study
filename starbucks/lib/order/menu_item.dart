import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const MenuItem({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => {},
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 21),
      child: Row(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
