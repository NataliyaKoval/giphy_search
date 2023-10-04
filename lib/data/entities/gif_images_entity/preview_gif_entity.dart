import 'package:giphy_search/domain/models/gif_images/preview_gif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preview_gif_entity.g.dart';

@JsonSerializable()
class PreviewGifEntity implements PreviewGif {
  const PreviewGifEntity({
    required this.height,
    required this.width,
    required this.url,
  });

  factory PreviewGifEntity.fromJson(Map<String, dynamic> json) =>
      _$PreviewGifEntityFromJson(json);

  @override
  @JsonKey(name: 'height')
  final String height;

  @override
  @JsonKey(name: 'width')
  final String width;

  @override
  @JsonKey(name: 'url')
  final String url;
}
