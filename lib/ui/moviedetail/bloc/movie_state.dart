part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieLoaded extends MovieState {
  final MovieDetail movie;
  MovieLoaded(this.movie);
}

final class MovieError extends MovieState {
  final String error;
  MovieError(this.error);
}
