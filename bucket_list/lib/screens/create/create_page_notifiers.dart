import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextFieldErrorMessageNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void set(String? errorMessage) => state = errorMessage;
}
