part of 'cat_image_infos_bloc.dart';

@immutable
sealed class CatImageInfosState {}

final class CatImageInfosInitial extends CatImageInfosState {}

final class CatImageInfosLoading extends CatImageInfosState {}

final class CatImageInfosError extends CatImageInfosState {
  CatImageInfosError({required this.error, required this.stackTrace});

  final Object error;
  final StackTrace stackTrace;
}

final class CatImageInfosLoaded extends CatImageInfosState {
  CatImageInfosLoaded({required this.catImageInfos});

  final List<CatImageInfo> catImageInfos;
}
