import 'package:giphy_search/domain/models/downsized.dart';
import 'package:giphy_search/domain/models/downsized_medium.dart';
import 'package:giphy_search/domain/models/preview_gif.dart';

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
