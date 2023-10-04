// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GifResponseEntity _$GifResponseEntityFromJson(Map<String, dynamic> json) =>
    GifResponseEntity(
      data: (json['data'] as List<dynamic>)
          .map((e) => GifEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          PaginationEntity.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GifResponseEntityToJson(GifResponseEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };
