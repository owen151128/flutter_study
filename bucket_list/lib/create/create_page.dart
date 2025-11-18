import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("버킷리스트 작성"),
      // 뒤로가기 버튼
      leading: IconButton(
        icon: Icon(CupertinoIcons.chevron_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: "하고 싶은 일을 입력하세요"),
          ),
          SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              child: Text("추가하기", style: TextStyle(fontSize: 18)),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    ),
  );
}
