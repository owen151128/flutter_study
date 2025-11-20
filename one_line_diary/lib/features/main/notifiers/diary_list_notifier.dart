import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_line_diary/features/main/models/diary.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> addDiary(String text) async {
    List<Diary> current = state.value ?? [];
    state = AsyncValue.data([
      ...current,
      Diary(text: text, createdAt: DateTime.now()),
    ]);

    _saveDiaryList();
  }

  Future<void> deleteAll() async {
    state = AsyncValue.data([]);
  }
}
