import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_image_info.freezed.dart';
part 'cat_image_info.g.dart';

@JsonSerializable()
@freezed
class CatImageInfo extends Equatable with _$CatImageInfo {
  CatImageInfo({this.id, this.url, this.width, this.height});

  factory CatImageInfo.fromJson(Map<String, dynamic> json) =>
      _$CatImageInfoFromJson(json);

  final String? id;
  final String? url;
  final int? width;
  final int? height;

  Map<String, dynamic> toJson() => _$CatImageInfoToJson(this);

  @override
  List<Object?> get props => [id, url, width, height];
}
