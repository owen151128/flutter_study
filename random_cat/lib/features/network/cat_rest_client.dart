import "package:dio/dio.dart";
import "package:random_cat/features/home/models/cat_image_info.dart";
import "package:retrofit/retrofit.dart";

part 'cat_rest_client.g.dart';

@RestApi(baseUrl: "https://api.thecatapi.com/v1/images/")
abstract class CatRestClient {
  factory CatRestClient(Dio dio, {String? baseUrl}) = _CatRestClient;

  @GET("/search")
  Future<List<CatImageInfo>> getCatImageInfo({
    @Query("limit") required int size,
    @Query("mime_types") String mimeTypes = "png",
  });
}
