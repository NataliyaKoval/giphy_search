// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GifEntity _$GifEntityFromJson(Map<String, dynamic> json) => GifEntity(
      id: json['id'] as String,
      url: json['url'] as String,
      title: json['title'] as String,
      images: GifImagesEntity.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GifEntityToJson(GifEntity instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'images': instance.images,
    };
