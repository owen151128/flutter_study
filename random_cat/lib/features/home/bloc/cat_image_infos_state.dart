part of 'cat_image_infos_bloc.dart';

@immutable
sealed class CatImageInfosState {
  const CatImageInfosState(this.catImageInfos);

  final List<CatImageInfo> catImageInfos;
}

final class CatImageInfosInitial extends CatImageInfosState {
  const CatImageInfosInitial(super.catImageInfos);
}

final class CatImageInfosLoading extends CatImageInfosState {
  const CatImageInfosLoading(super.catImageInfos);
}

final class CatImageInfosError extends CatImageInfosState {
  const CatImageInfosError(super.catImageInfos, this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;
}

final class CatImageInfosLoaded extends CatImageInfosState {
  const CatImageInfosLoaded(super.catImageInfos);
}
