import 'package:bucket_list/models/bucket.dart';
import 'package:bucket_list/providors.dart';
import 'package:bucket_list/screens/create/create_page.dart';
import 'package:bucket_list/screens/home/home_page_notifiers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void showDeleteDialog(
    BuildContext context,
    BucketListNotifier notifier,
    int index,
  ) {
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
                notifier.remove(index);
                Navigator.pop(context);
              },
              child: Text("확인", style: TextStyle(color: Colors.pink)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Bucket> bucketList = ref.watch(bucketListProvider);
    final bucketListNotifier = ref.read(bucketListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("버킷 리스트"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
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
                      showDeleteDialog(context, bucketListNotifier, index);
                    },
                  ),
                  onTap: () {
                    bucketListNotifier.toggleDone(index);
                  },
                );
              },
            ),
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
}
