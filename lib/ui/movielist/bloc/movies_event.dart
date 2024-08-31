part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}

final class SearchMovies extends MoviesEvent {
  final String query;
  SearchMovies(this.query);
}

final class LoadMoreMovies extends MoviesEvent {}