import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/data/mapper/movie_mapper.dart';
import 'package:movie/data/remote/request/movies_request.dart';
import 'package:movie/data/remote/response/genres_response.dart';
import 'package:movie/data/remote/service_api.dart';
import 'package:movie/ui/movielist/model/movie_item.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final ServiceApi serviceApi;
  final MoviesRequest request = MoviesRequest();
  final MovieMapper mapper = MovieMapper();
  List<MovieItem> movies = [];
  List<Genres> genres = [];

  MoviesBloc(this.serviceApi) : super(MoviesInitial()) {
    on<SearchMovies>((event, emit) async {
      emit(MoviesLoading());
      try {
        request.query = event.query;
        request.page = 1;
        if (genres.isEmpty) {
          final genresResponse = await serviceApi.getGenres();
          if (genresResponse.genres != null) genres = genresResponse.genres!;
        }
        final moviesResponse = await serviceApi.getMovies(request);
        movies = mapper.toMovieList(moviesResponse, genres);
        emit(MoviesLoaded(movies));
      } catch(e) {
        emit(MoviesError(e.toString()));
      }
    });
    on<LoadMoreMovies>((event, emit) async {
      try {
        request.page = (request.page ?? 0) + 1;
        final moviesResponse = await serviceApi.getMovies(request);
        movies.addAll(mapper.toMovieList(moviesResponse, genres));
        emit(MoviesLoaded(movies));
      } catch(e) {
        // emit(MoviesError(e.toString()));
        debugPrint(e.toString());
      }
    });
  }
}
