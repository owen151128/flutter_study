import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_line_diary/features/main/providors/diary_list_providor.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaryListNotifier = ref.read(diaryListProvider.notifier);
    final diaryList = ref.watch(diaryListProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(1900, 1, 1),
                lastDay: DateTime(3000, 12, 31),
                eventLoader: (day) {
                  return [Text("a"), Text("b")];
                },
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
                child: diaryList.when(
                  data: (data) => data.isEmpty
                      ? Center(
                          child: InkWell(
                            onTap: () {
                              diaryListNotifier.addDiary("asdfqwer");
                              diaryListNotifier.addDiary("asdfqwer");
                              diaryListNotifier.addDiary("asdfqwer");
                              diaryListNotifier.addDiary("asdfqwer");
                              diaryListNotifier.addDiary("asdfqwer");
                            },
                            child: Text(
                              "한 줄 일기를 작성해주세요.",
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () => diaryListNotifier.deleteAll(),
                              title: Text(
                                data[index].text,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Text(
                                data[index].createdAt.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          },
                        ),
                  error: (error, stackTrace) => Text("Error!"),
                  loading: () => Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
