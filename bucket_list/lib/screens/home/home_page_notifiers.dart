import 'package:bucket_list/models/bucket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BucketListNotifier extends Notifier<List<Bucket>> {
  @override
  List<Bucket> build() => [];

  void add(String bucket) => state = [...state, Bucket(bucket, false)];

  void toggleDone(int index) {
    state[index].isDone = !state[index].isDone;
    state = [...state];
  }

  void remove(int index) {
    state.removeAt(index);
    state = [...state];
  }
}
