import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/data/mapper/movie_mapper.dart';
import 'package:movie/data/remote/service_api.dart';
import 'package:movie/ui/moviedetail/model/movie_detail.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ServiceApi serviceApi;
  final MovieMapper mapper = MovieMapper();

  MovieBloc(this.serviceApi) : super(MovieInitial()) {
    on<LoadMovie>((event, emit) async {
      emit(MovieLoading());
      try {
        final movieResponse = await serviceApi.getMovieDetail(event.movieId);
        emit(MovieLoaded(mapper.toMovieDetail(movieResponse)));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });
  }
}
