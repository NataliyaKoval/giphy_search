import 'package:giphy_search/data/entities/gif_images_entity/downsized_entity.dart';
import 'package:giphy_search/data/entities/gif_images_entity/downsized_medium_entity.dart';
import 'package:giphy_search/data/entities/gif_images_entity/preview_gif_entity.dart';
import 'package:giphy_search/domain/models/gif_images/gif_images.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gif_images_entity.g.dart';

@JsonSerializable()
class GifImagesEntity implements GifImages {
  const GifImagesEntity({
    required this.downsized,
    required this.downsizedMedium,
    required this.previewGif,
  });

  factory GifImagesEntity.fromJson(Map<String, dynamic> json) =>
      _$GifImagesEntityFromJson(json);

  @override
  @JsonKey(name: 'downsized')
  final DownsizedEntity downsized;

  @override
  @JsonKey(name: 'downsized_medium')
  final DownsizedMediumEntity downsizedMedium;

  @override
  @JsonKey(name: 'preview_gif')
  final PreviewGifEntity previewGif;
}
