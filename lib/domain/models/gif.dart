import 'package:giphy_search/domain/models/gif_images.dart';

class Gif {
  const Gif({
    required this.id,
    required this.url,
    required this.title,
    required this.images,
  });

  final String id;
  final String url;
  final String title;
  final GifImages images;
}
