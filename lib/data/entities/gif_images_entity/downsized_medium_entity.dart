import 'package:giphy_search/domain/models/gif_images/downsized_medium.dart';
import 'package:json_annotation/json_annotation.dart';

part 'downsized_medium_entity.g.dart';

@JsonSerializable()
class DownsizedMediumEntity implements DownsizedMedium {
  const DownsizedMediumEntity({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  factory DownsizedMediumEntity.fromJson(Map<String, dynamic> json) =>
      _$DownsizedMediumEntityFromJson(json);

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
