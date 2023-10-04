// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif_images_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GifImagesEntity _$GifImagesEntityFromJson(Map<String, dynamic> json) =>
    GifImagesEntity(
      downsized:
          DownsizedEntity.fromJson(json['downsized'] as Map<String, dynamic>),
      downsizedMedium: DownsizedMediumEntity.fromJson(
          json['downsized_medium'] as Map<String, dynamic>),
      previewGif: PreviewGifEntity.fromJson(
          json['preview_gif'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GifImagesEntityToJson(GifImagesEntity instance) =>
    <String, dynamic>{
      'downsized': instance.downsized,
      'downsized_medium': instance.downsizedMedium,
      'preview_gif': instance.previewGif,
    };
