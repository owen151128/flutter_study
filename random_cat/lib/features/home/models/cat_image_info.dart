import "package:json_annotation/json_annotation.dart";

part 'cat_image_info.g.dart';

@JsonSerializable()
class CatImageInfo {
  CatImageInfo({this.id, this.url, this.width, this.height});

  factory CatImageInfo.fromJson(Map<String, dynamic> json) =>
      _$CatImageInfoFromJson(json);

  final String? id;
  final String? url;
  final int? width;
  final int? height;

  Map<String, dynamic> toJson() => _$CatImageInfoToJson(this);
}
