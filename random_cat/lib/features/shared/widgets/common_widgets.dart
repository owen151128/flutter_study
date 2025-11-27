import 'package:flutter/material.dart';

class CommonWidgets {
  static Widget loadingWidget(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.07,
          height: MediaQuery.of(context).size.height * 0.07,
          child: CircularProgressIndicator(color: Colors.amberAccent),
        ),
        SizedBox(height: 20),
        Text(
          "로딩중...",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
      ],
    ),
  );

  static Widget retryWidget(BuildContext context, void Function() onPressed) =>
      Center(
        child: TextButton(
          onPressed: () => onPressed(),
          child: Text("재시도", style: TextStyle(fontSize: 32)),
        ),
      );

  static void showErrorDialog(
    BuildContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("오류"),
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text("$error\n$stackTrace"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("확인"),
          ),
        ],
      ),
    );
  }
}
