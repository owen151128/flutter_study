part of 'cat_image_infos_bloc.dart';

@immutable
sealed class CatImageInfosEvent {}

final class CatImageInfosLoad extends CatImageInfosEvent {
  CatImageInfosLoad({this.count = 10});

  final int count;
}
