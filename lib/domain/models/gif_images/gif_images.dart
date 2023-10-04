import 'package:giphy_search/domain/models/gif_images/downsized.dart';
import 'package:giphy_search/domain/models/gif_images/downsized_medium.dart';
import 'package:giphy_search/domain/models/gif_images/preview_gif.dart';

class GifImages {
  const GifImages({
    required this.downsized,
    required this.downsizedMedium,
    required this.previewGif,
  });

  final Downsized downsized;
  final DownsizedMedium downsizedMedium;
  final PreviewGif previewGif;
}
