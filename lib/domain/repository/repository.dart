import 'package:giphy_search/domain/models/gif_response.dart';

abstract class Repository {
  Future<GifResponse> getGifs({required String query, required int offset});
}
