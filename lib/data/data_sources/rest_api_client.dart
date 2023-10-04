import 'package:dio/dio.dart';
import 'package:giphy_search/data/entities/gif_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi(baseUrl: 'https://api.giphy.com/v1')
abstract class RestApiClient {
  factory RestApiClient(Dio dio, {String baseUrl}) = _RestApiClient;

  @GET('/gifs/search')
  Future<GifResponseEntity> fetchGitRepos(
    @Query('api_key') String apiKey,
    @Query('q') String query,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );
}
