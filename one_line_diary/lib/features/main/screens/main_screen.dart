import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:one_line_diary/features/main/notifiers/diary_list_notifier.dart';
import 'package:one_line_diary/features/main/providors/diary_list_providor.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaryListNotifier = ref.read(diaryListProvider.notifier);
    final diaryList = ref.watch(diaryListProvider);
    final selectedDateTimeNotifier = ref.read(
      selectedDateTimeProvider.notifier,
    );
    final selectedDateTime = ref.watch(selectedDateTimeProvider);
    final filteredDiaryList = diaryListNotifier.getDiaryByDate(
      selectedDateTime,
    );
    final textEditingController = ref.watch(textEditingControllerProvider);

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
                  return diaryListNotifier.getDiaryByDate(day);
                },
                selectedDayPredicate: (day) => isSameDay(day, selectedDateTime),
                onDaySelected: (selectedDay, focusedDay) {
                  selectedDateTimeNotifier.set(selectedDay);
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey.shade300),
              Expanded(
                child: diaryList.when(
                  data: (data) => filteredDiaryList.isEmpty
                      ? Center(
                          child: Text(
                            "한 줄 일기를 작성해주세요.",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredDiaryList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () => showInputTextDialog(
                                "일기 수정",
                                "수정",
                                TextField(
                                  controller: textEditingController,
                                  autofocus: true,
                                  // 커서 색상
                                  cursorColor: Colors.indigo,
                                  decoration: InputDecoration(
                                    hintText: "한 줄 일기를 작성해주세요.",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ),
                                () {
                                  if (textEditingController.text.isNotEmpty) {
                                    diaryListNotifier.modifyDiary(
                                      textEditingController.text,
                                      filteredDiaryList[index].createdAt,
                                    );
                                    textEditingController.text = "";
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("내용이 없습니다."),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                  Navigator.pop(context);
                                },
                                context,
                              ),
                              onLongPress: () => showInputTextDialog(
                                "일기 삭제",
                                "삭제",
                                Text(
                                  "\"${filteredDiaryList[index].text}\" 를 삭제하시겠습니까?",
                                ),
                                () {
                                  diaryListNotifier.remove(
                                    filteredDiaryList[index].createdAt,
                                  );
                                  Navigator.pop(context);
                                },
                                context,
                              ),
                              title: Text(
                                filteredDiaryList[index].text,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Text(
                                DateFormat(
                                  "kk:mm:ss",
                                ).format(filteredDiaryList[index].createdAt),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => showInputTextDialog(
          "일기 작성",
          "작성",
          TextField(
            controller: textEditingController,
            autofocus: true,
            // 커서 색상
            cursorColor: Colors.indigo,
            decoration: InputDecoration(
              hintText: "한 줄 일기를 작성해주세요.",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
              ),
            ),
          ),
          () {
            if (textEditingController.text.isNotEmpty) {
              diaryListNotifier.addDiary(
                textEditingController.text,
                selectedDateTime,
              );
              textEditingController.text = "";
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("내용이 없습니다."),
                  duration: Duration(seconds: 2),
                ),
              );
            }
            Navigator.pop(context);
          },
          context,
        ),
        shape: CircleBorder(),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: Icon(Icons.create),
      ),
    );
  }

  void showInputTextDialog(
    String title,
    String positiveText,
    Widget content,
    void Function() positiveCallback,
    BuildContext context,
  ) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        TextButton(onPressed: positiveCallback, child: Text(positiveText)),
      ],
    ),
  );
}
