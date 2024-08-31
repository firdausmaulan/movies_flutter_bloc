import 'package:movie/data/remote/response/genres_response.dart';
import 'package:movie/data/remote/response/movie_response.dart';
import 'package:movie/data/remote/response/movies_response.dart';
import 'package:movie/ui/moviedetail/model/movie_detail.dart';
import 'package:movie/ui/movielist/model/movie_item.dart';
import 'package:movie/util/constant.dart';

class MovieMapper {
  List<MovieItem> toMovieList(MoviesResponse moviesResponse, List<Genres> genres) {
    List<MovieItem> list = [];
    moviesResponse.results?.forEach((element) {
      String formattedGenres = getGenresByIds(genres, element.genreIds);
      String posterUrl = "${Constant.imageUrl}${element.posterPath}";
      String formattedVoteAverage = "${element.voteAverage?.toStringAsFixed(1)} / 10";
      var movieItem = toMovieItem(element);
      movieItem = movieItem.copyWith(
          genres: formattedGenres,
          posterUrl: posterUrl,
          formattedVoteAverage:  formattedVoteAverage
      );
      list.add(movieItem);
    });
    return list;
  }

  MovieItem toMovieItem(Results results) {
    return MovieItem.fromJson(results.toJson());
  }

  MovieDetail toMovieDetail(MovieResponse movieResponse) {
    String backdropUrl = "${Constant.imageUrl}${movieResponse.backdropPath}";
    var movieDetail = MovieDetail.fromJson(movieResponse.toJson());
    movieDetail = movieDetail.copyWith(backdropUrl : backdropUrl);
    return movieDetail;
  }

  String getGenresByIds(List<Genres> genres, List<int>? genreIds) {
    if (genreIds == null || genreIds.isEmpty) {
      return ""; // Handle empty or null genreIds gracefully
    }

    final formattedGenres = genreIds
        .map((id) => genres.firstWhere((genre) => genre.id == id).name ?? "")
        .join(", "); // Use join for efficient concatenation

    return formattedGenres.trimRight(); // Remove trailing comma if present
  }
}
