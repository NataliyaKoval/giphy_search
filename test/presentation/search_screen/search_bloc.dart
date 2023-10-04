import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giphy_search/domain/models/gif.dart';
import 'package:giphy_search/domain/models/gif_images/downsized.dart';
import 'package:giphy_search/domain/models/gif_images/downsized_medium.dart';
import 'package:giphy_search/domain/models/gif_images/gif_images.dart';
import 'package:giphy_search/domain/models/gif_images/preview_gif.dart';
import 'package:giphy_search/domain/models/gif_response.dart';
import 'package:giphy_search/domain/models/pagination.dart';
import 'package:giphy_search/domain/use_cases/get_gifs_use_case.dart';
import 'package:giphy_search/presentation/search_screen/bloc/search_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetGifsUseCase extends Mock implements GetGifsUseCase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const Downsized downsized =
  Downsized(height: '111', width: '222', size: '333', url: 'url');
  const DownsizedMedium downsizedMedium =
  DownsizedMedium(height: '111', width: '222', size: '333', url: 'url');
  const PreviewGif previewGif =
  PreviewGif(height: '111', width: '222', url: 'url');
  const GifImages images = GifImages(
      downsized: downsized,
      downsizedMedium: downsizedMedium,
      previewGif: previewGif);

  const List<Gif> data = [
    Gif(id: 'qwe1', url: 'asd1', title: 'zxc1', images: images),
    Gif(id: 'qwe2', url: 'asd2', title: 'zxc2', images: images),
  ];
  const Pagination pagination = Pagination(totalCount: 20, count: 2, offset: 0);

  group('SearchBloc', () {
    const GifResponse mockResponse =
        GifResponse(data: data, pagination: pagination);

    late GetGifsUseCase getGifsUseCase;
    late SearchBloc searchBloc;

    setUp(() {
      getGifsUseCase = MockGetGifsUseCase();
      searchBloc = SearchBloc(getGifsUseCase: getGifsUseCase);
    });

    setUpAll(() {
      registerFallbackValue(const GetGifParams(query: '', offset: 0));
    });

    tearDown(() {
      searchBloc.close();
    });

    test('initial state is SearchInitial', () {
      expect(searchBloc.state, SearchInitial());
    });

    test('close does not emit new states', () {
      expectLater(
        searchBloc.stream,
        emitsThrough(emitsDone),
      );
      searchBloc.close();
    });

    blocTest<SearchBloc, SearchState>(
      'emits SearchLoaded after fetching gifs',
      setUp: () {
        when(() => getGifsUseCase(any())).thenAnswer((_) async => mockResponse);
      },
      build: () => searchBloc,
      act: (bloc) => bloc.add(SearchGifsEvent('aaa')),
      wait: const Duration(milliseconds: 1000),
      expect: () => [SearchLoaded(gifs: mockResponse.data)],
    );
  });
}
