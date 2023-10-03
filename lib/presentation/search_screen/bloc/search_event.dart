part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchGifsEvent extends SearchEvent {
  SearchGifsEvent(this.query);

  final String query;
}

class ChangeInputEvent extends SearchEvent {}