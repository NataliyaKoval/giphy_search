class Pagination {
  const Pagination({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  final int totalCount;
  final int count;
  final int offset;
}
