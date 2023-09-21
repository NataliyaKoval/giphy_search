import 'package:giphy_search/data/entities/gif_entity.dart';
import 'package:giphy_search/data/entities/pagination_entity.dart';
import 'package:giphy_search/domain/models/gif_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gif_response_entity.g.dart';

@JsonSerializable()
class GifResponseEntity implements GifResponse {
  const GifResponseEntity({
    required this.data,
    required this.pagination,
  });

  factory GifResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GifResponseEntityFromJson(json);

  @override
  @JsonKey(name: 'data')
  final List<GifEntity> data;

  @override
  @JsonKey(name: 'pagination')
  final PaginationEntity pagination;
}
