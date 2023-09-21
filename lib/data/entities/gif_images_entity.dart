import 'package:giphy_search/data/entities/downsized_entity.dart';
import 'package:giphy_search/domain/models/gif_images.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gif_images_entity.g.dart';

@JsonSerializable()
class GifImagesEntity implements GifImages {
  const GifImagesEntity({
    required this.downsized,
  });

  factory GifImagesEntity.fromJson(Map<String, dynamic> json) =>
      _$GifImagesEntityFromJson(json);

  @override
  @JsonKey(name: 'downsized')
  final DownsizedEntity downsized;
}
