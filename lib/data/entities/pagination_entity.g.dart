// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationEntity _$PaginationEntityFromJson(Map<String, dynamic> json) =>
    PaginationEntity(
      totalCount: json['total_count'] as int,
      count: json['count'] as int,
      offset: json['offset'] as int,
    );

Map<String, dynamic> _$PaginationEntityToJson(PaginationEntity instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'count': instance.count,
      'offset': instance.offset,
    };
