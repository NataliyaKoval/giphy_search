import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_search/domain/models/gif.dart';
import 'package:giphy_search/domain/models/gif_response.dart';
import 'package:giphy_search/domain/use_cases/get_gifs_use_case.dart';
import 'package:giphy_search/utils/debouncer.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.getGifsUseCase,
  }) : super(SearchInitial()) {
    on<SearchGifsEvent>(_searchGifs, transformer: Debouncer.debounce());
  }

  final GetGifsUseCase getGifsUseCase;

  bool isFutureRunning = false;
  int offset = 0;

  Future<void> _searchGifs(
      SearchGifsEvent event, Emitter<SearchState> emit) async {
    if (isFutureRunning) {
      return;
    }

    isFutureRunning = true;
    emit(SearchLoading());
    try {
      GifResponse response = await getGifsUseCase(
          GetGifParams(query: event.query, offset: offset));
      List<Gif> gifs = response.data;

      if (gifs.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded(gifs: gifs));
      }
    } catch (e) {
      print(e);
    } finally {
      isFutureRunning = false;
    }
  }
}
