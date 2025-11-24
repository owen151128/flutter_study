import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_cat/random_cat_app.dart';

void main() {
  runApp(ProviderScope(child: const RandomCatApp()));
}
