import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/data/remote/service_api.dart';
import 'package:movie/ui/common/search/search_field.dart';
import 'package:movie/ui/moviedetail/movies_detail_page.dart';
import 'package:movie/ui/movielist/bloc/movies_bloc.dart';
import 'package:movie/ui/movielist/widget/movie_card.dart';
import 'package:movie/util/constant.dart';

class MovieListPage extends StatelessWidget {
  MovieListPage({super.key});

  final bloc = MoviesBloc(ServiceApi());

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (bloc.movies.isNotEmpty) {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          bloc.add(LoadMoreMovies());
        }
      }
    });

    return BlocProvider(
      create: (context) => bloc..add(SearchMovies(Constant.defaultQuery)),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Movie List'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SearchField(
                  hintText: "Search Movie",
                  onSearch: (query) => {bloc.add(SearchMovies(query))},
                ),
                BlocBuilder<MoviesBloc, MoviesState>(
                  builder: (context, state) {
                    if (state is MoviesInitial || state is MoviesLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is MoviesLoaded) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: bloc.movies.length,
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            final movieItem = bloc.movies[index];
                            return InkWell(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetailPage(
                                          movieId: movieItem.id)),
                                )
                              },
                              child: MovieCard(
                                movieItem: movieItem,
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is MoviesError) {
                      return SnackBar(content: Text(state.error));
                    }
                    return const Text("Unknown MoviesState");
                  },
                )
              ],
            ),
          )),
    );
  }
}
