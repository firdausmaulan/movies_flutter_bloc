part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

final class LoadMovie extends MovieEvent {
  final int? movieId;
  LoadMovie(this.movieId);
}