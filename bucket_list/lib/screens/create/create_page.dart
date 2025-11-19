import 'package:bucket_list/providors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_page_notifiers.dart';

class CreatePage extends ConsumerWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? textFieldErrorMessage = ref.watch(textFieldErrorMessageProvider);
    TextEditingController textEditingController = ref.watch(
      textEditingControllerProvider,
    );

    final bucketListNotifier = ref.read(bucketListProvider.notifier);
    final textFieldErrorMessageNotifier = ref.read(
      textFieldErrorMessageProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("버킷리스트 작성"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "하고 싶은 일을 입력하세요",
                errorText: textFieldErrorMessage,
              ),
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
                    textFieldErrorMessageNotifier.set(null);
                    textEditingController.text = "";
                    bucketListNotifier.add(job);
                    Navigator.pop(context);
                  } else {
                    textFieldErrorMessageNotifier.set("내용을 입력해주세요.");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
