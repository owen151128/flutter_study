import 'package:bucket_list/models/bucket.dart';
import 'package:bucket_list/screens/create/create_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bucket> bucketList = [];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("버킷 리스트")),
    body: bucketList.isEmpty
        ? Center(child: Text("버킷 리스트를 작성해 주세요."))
        : ListView.builder(
            itemCount: bucketList.length,
            itemBuilder: (context, index) {
              Bucket bucket = bucketList[index];
              return ListTile(
                title: Text(
                  bucket.job,
                  style: TextStyle(
                    fontSize: 24,
                    color: bucket.isDone ? Colors.grey : Colors.black,
                    decoration: bucket.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(CupertinoIcons.delete),
                  onPressed: () {
                    showDeleteDialog(context, index);
                  },
                ),
                onTap: () {
                  setState(() => bucket.isDone = !bucket.isDone);
                },
              );
            },
          ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        String? job = await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CreatePage()),
        );
        if (job != null) {
          setState(() => bucketList.add(Bucket(job, false)));
        }
      },
    ),
  );

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("정말로 삭제하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                setState(() => bucketList.removeAt(index));
                Navigator.pop(context);
              },
              child: Text("확인", style: TextStyle(color: Colors.pink)),
            ),
          ],
        );
      },
    );
  }
}
