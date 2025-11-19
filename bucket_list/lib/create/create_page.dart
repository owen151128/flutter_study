import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController textEditingController = TextEditingController();
  String? error;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("버킷리스트 작성"),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: textEditingController,
            autofocus: true,
            decoration: InputDecoration(hintText: "하고 싶은 일을 입력하세요", errorText: error),
          ),
          SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              child: Text("추가하기", style: TextStyle(fontSize: 18)),
              onPressed: () {
                String job = textEditingController.text;
                if (job.isNotEmpty) {
                  setState(() => error = null);
                  Navigator.pop(context, job);
                } else {
                  setState(() => error = "내용을 입력해주세요.");
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}
