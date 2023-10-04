import 'package:giphy_search/data/entities/gif_images_entity/gif_images_entity.dart';
import 'package:giphy_search/domain/models/gif.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gif_entity.g.dart';

@JsonSerializable()
class GifEntity implements Gif {
  const GifEntity({
    required this.id,
    required this.url,
    required this.title,
    required this.images,
  });

  factory GifEntity.fromJson(Map<String, dynamic> json) =>
      _$GifEntityFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;

  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  @JsonKey(name: 'title')
  final String title;

  @override
  @JsonKey(name: 'images')
  final GifImagesEntity images;
}
