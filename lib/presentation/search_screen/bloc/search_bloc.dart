import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_search/domain/models/gif.dart';
import 'package:giphy_search/domain/models/gif_response.dart';
import 'package:giphy_search/domain/models/pagination.dart';
import 'package:giphy_search/domain/use_cases/get_gifs_use_case.dart';
import 'package:giphy_search/utils/debouncer.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.getGifsUseCase,
  }) : super(SearchInitial()) {
    on<SearchGifsEvent>(_searchGifs, transformer: Debouncer.debounce());
    on<ChangeInputEvent>(_clearSearchResultList);
  }

  final GetGifsUseCase getGifsUseCase;

  bool isFutureRunning = false;
  int offset = 0;
  List<Gif> allGifs = [];

  Future<void> _searchGifs(
      SearchGifsEvent event, Emitter<SearchState> emit) async {
    if (isFutureRunning) {
      return;
    }
    isFutureRunning = true;
    try {
      GifResponse response = await getGifsUseCase(
          GetGifParams(query: event.query, offset: offset));
      List<Gif> gifs = response.data;
      Pagination pagination = response.pagination;
      if (gifs.isEmpty) {
        emit(SearchEmpty());
      } else {
        allGifs.addAll(gifs);
        offset = pagination.offset + pagination.count;
        emit(SearchLoaded(gifs: allGifs));
      }
    } catch (e) {
      print(e);
    } finally {
      isFutureRunning = false;
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void _clearSearchResultList(ChangeInputEvent event, Emitter<SearchState> emit) {
    allGifs.clear();
  }
}
