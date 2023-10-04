part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchEmpty extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoaded extends SearchState {
  SearchLoaded({
    required this.gifs,
  });

  final List<Gif> gifs;

  @override
  List<Object?> get props => [gifs];
}

class SearchError extends SearchState {
  SearchError({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
