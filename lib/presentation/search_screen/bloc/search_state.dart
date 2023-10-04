part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchLoaded extends SearchState {
  SearchLoaded({
    required this.gifs,
  });

  final List<Gif> gifs;
}

class SearchError extends SearchState {
  SearchError({
    required this.message,
  });

  final String message;
}
