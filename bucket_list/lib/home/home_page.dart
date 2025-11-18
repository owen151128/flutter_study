import 'package:bucket_list/create/create_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("버킷 리스트")),
    body: Center(child: Text("버킷 리스트 를 작성해 주세요.")),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CreatePage()),
        );
      },
    ),
  );
}
