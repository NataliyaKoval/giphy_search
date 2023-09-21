import 'package:giphy_search/domain/models/gif.dart';
import 'package:giphy_search/domain/models/pagination.dart';

class GifResponse {
  const GifResponse({
    required this.data,
    required this.pagination,
  });

  final List<Gif> data;
  final Pagination pagination;
}
