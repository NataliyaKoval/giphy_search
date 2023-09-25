import 'package:giphy_search/domain/models/gif_response.dart';
import 'package:giphy_search/domain/repository/repository.dart';
import 'package:giphy_search/domain/use_cases/use_case.dart';

class GetGifsUseCase implements UseCase<GifResponse, GetGifParams> {
  const GetGifsUseCase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<GifResponse> call(GetGifParams params) {
    return repository.getGifs(query: params.query, offset: params.offset);
  }
}

class GetGifParams {
  const GetGifParams({
    required this.query,
    required this.offset,
  });

  final String query;
  final int offset;
}
