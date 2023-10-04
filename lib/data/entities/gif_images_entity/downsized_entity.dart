import 'package:giphy_search/domain/models/gif_images/downsized.dart';
import 'package:json_annotation/json_annotation.dart';

part 'downsized_entity.g.dart';

@JsonSerializable()
class DownsizedEntity implements Downsized {
  const DownsizedEntity({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  factory DownsizedEntity.fromJson(Map<String, dynamic> json) =>
      _$DownsizedEntityFromJson(json);

  @override
  @JsonKey(name: 'height')
  final String height;

  @override
  @JsonKey(name: 'width')
  final String width;

  @override
  @JsonKey(name: 'size')
  final String size;

  @override
  @JsonKey(name: 'url')
  final String url;
}
