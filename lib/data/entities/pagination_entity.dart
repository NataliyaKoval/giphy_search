import 'package:giphy_search/domain/models/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_entity.g.dart';

@JsonSerializable()
class PaginationEntity implements Pagination {
  const PaginationEntity({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  factory PaginationEntity.fromJson(Map<String, dynamic> json) =>
      _$PaginationEntityFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;

  @override
  @JsonKey(name: 'count')
  final int count;

  @override
  @JsonKey(name: 'offset')
  final int offset;
}
