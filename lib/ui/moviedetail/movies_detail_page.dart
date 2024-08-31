import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/data/remote/service_api.dart';
import 'package:movie/ui/moviedetail/bloc/movie_bloc.dart';
import 'package:movie/util/constant.dart';

class MovieDetailPage extends StatelessWidget {
  final int? movieId;

  MovieDetailPage({super.key, required this.movieId});

  final bloc = MovieBloc(ServiceApi());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(LoadMovie(movieId)),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Movie Detail"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieInitial || state is MovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      height: 240,
                      fit: BoxFit.cover,
                      imageUrl:
                          "${Constant.imageUrl}${state.movie.backdropPath}",
                      placeholder: (context, url) => const Center(
                          child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(),
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          const Text("Title",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(state.movie.title.toString()),
                          const SizedBox(height: 8),
                          const Text("Overview",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(state.movie.overview.toString())
                        ],
                      ),
                    )
                  ],
                );
              } else if (state is MovieError) {
                return SnackBar(content: Text(state.error));
              }
              return const Text("Unknown MoviesState");
            },
          )),
    );
  }
}
