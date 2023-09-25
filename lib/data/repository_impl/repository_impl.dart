import 'package:giphy_search/data/data_sources/rest_api_client.dart';
import 'package:giphy_search/domain/models/gif_response.dart';
import 'package:giphy_search/domain/repository/repository.dart';

const apiKey = String.fromEnvironment('API_KEY');
const limit = 10;

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.restApiClient,
  });

  final RestApiClient restApiClient;

  @override
  Future<GifResponse> getGifs({required String query, required int offset}) {
    return restApiClient.fetchGitRepos(apiKey, query, limit, offset);
  }
}
