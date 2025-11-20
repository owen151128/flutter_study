import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(1900, 1, 1),
              lastDay: DateTime(3000, 12, 31),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(color: Colors.transparent),
                todayTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),
            Expanded(
              child: Center(
                child: Text(
                  "한 줄 일기를 작성해주세요.",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              // child: ListView.builder(
              //   itemCount: 20,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text(
              //         "더미 문자열 입니다 123",
              //         style: TextStyle(fontSize: 24, color: Colors.black),
              //         // TextStyle(color: Colors.grey, fontSize: 18)
              //       ),
              //       trailing: Text(
              //         "12:34",
              //         style: TextStyle(color: Colors.grey, fontSize: 12),
              //       ),
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    ),
  );
}
