import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:random_cat/my_bloc_observer.dart';
import 'package:random_cat/random_cat_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const RandomCatApp());
}
