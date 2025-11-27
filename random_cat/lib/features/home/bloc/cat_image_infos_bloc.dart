import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:random_cat/features/shared/network/cat_rest_client.dart';
import 'package:random_cat/features/shared/network/models/cat_image_info.dart';

part 'cat_image_infos_event.dart';
part 'cat_image_infos_state.dart';

class CatImageInfosBloc extends Bloc<CatImageInfosEvent, CatImageInfosState> {
  CatImageInfosBloc() : super(CatImageInfosInitial()) {
    on<CatImageInfosLoad>(onCatImageInfosLoad);
    add(CatImageInfosLoad());
  }

  Future<void> onCatImageInfosLoad(
    CatImageInfosLoad event,
    Emitter<CatImageInfosState> emit,
  ) async {
    try {
      emit(CatImageInfosLoading());
      final Dio dio = Dio();
      final CatRestClient catRestClient = CatRestClient(dio);
      emit(
        CatImageInfosLoaded(
          catImageInfos: await catRestClient.getCatImageInfo(size: event.count),
        ),
      );
    } catch (e, st) {
      emit(CatImageInfosError(error: e, stackTrace: st));
    }
  }
}
