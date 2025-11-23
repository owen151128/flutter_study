import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_line_diary/features/main/models/diary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class DiaryListNotifier extends AsyncNotifier<List<Diary>> {
  static const String sharedPreferenceKey = "diary_list";

  @override
  Future<List<Diary>> build() async => await loadDiaryList();

  Future<List<Diary>> loadDiaryList() async {
    state = AsyncValue.loading();
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? jsonString = sharedPreferences.getStringList(
      sharedPreferenceKey,
    );
    if (jsonString == null) {
      return <Diary>[];
    }

    return jsonString.map((e) => Diary.fromJson(jsonDecode(e))).toList();
  }

  Future<void> _saveDiaryList() async {
    List<Diary> current = state.value ?? [];
    List<String> encodedList = current
        .map((e) => jsonEncode(e.toJson()))
        .toList();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(sharedPreferenceKey, encodedList);
  }

  Future<void> addDiary(String text, DateTime selectedDateTime) async {
    DateTime now = DateTime.now();
    DateTime finalDateTime = DateTime.utc(
      selectedDateTime.year,
      selectedDateTime.month,
      selectedDateTime.day,
      now.hour,
      now.minute,
      now.second,
    );
    List<Diary> current = state.value ?? [];
    state = AsyncValue.data([
      ...current,
      Diary(text: text, createdAt: finalDateTime),
    ]);

    _saveDiaryList();
  }

  List<Diary> getDiaryByDate(DateTime selectedDateTime) {
    return (state.value ?? [])
        .where((e) => isSameDay(e.createdAt, selectedDateTime))
        .toList();
  }

  Future<void> modifyDiary(String text, DateTime createdAt) async {
    List<Diary> current = state.value ?? [];
    current.where((e) => e.createdAt == createdAt).toList().first.text = text;
    state = AsyncValue.data([...current]);
  }

  Future<void> remove(DateTime createdAt) async {
    List<Diary> current = state.value ?? [];
    current.removeWhere((e) => e.createdAt == createdAt);
    state = AsyncValue.data([...current]);
    _saveDiaryList();
  }
}
