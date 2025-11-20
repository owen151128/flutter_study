import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_line_diary/features/main/models/diary.dart';
import 'package:one_line_diary/features/main/notifiers/diary_list_notifier.dart';

final diaryListProvider = AsyncNotifierProvider<DiaryListNotifier, List<Diary>>(
  () => DiaryListNotifier(),
);
