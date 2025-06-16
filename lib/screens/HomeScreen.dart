import 'package:day_3/screens/all_movies_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data_layer/data_src.dart';
import '../data_layer/dummy_data.dart';
import '../main.dart';
import '../model/enum_types.dart';
import '../model/movie_model.dart';
import 'MovieDetailScreen.dart';
import 'all_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> trendingMovies = dummyListMovie.toList();

  void onTypeClick(String tag) {
    getPopularMovieByTag(tag).then((d) {
      setState(() {
        this.trendingMovies = d;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.menu, size: 28),
                Icon(Icons.search, size: 28),
              ],
            ),
            const SizedBox(height: 24),

            Text(
              'Movies',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    MovieType.values.map((t) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextButton(
                          onPressed: () {
                            onTypeClick(t.name);
                          },

                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.blue,
                            ),
                            textStyle: WidgetStatePropertyAll(
                              TextStyle(color: Colors.blue),
                            ),
                          ),
                          child: Text(
                            t.name,

                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle(
              'Popular',
              context,
              AllMovies(movies: dummyListMovie),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: trendingMovies.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final movie = trendingMovies[index];
                  return _movieCard(context, movie);
                },
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle(
              'Trending',
              context,
              AllMoviesGrid(movies: dummyListMovie),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: trendingMovies.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final movie = trendingMovies[index];
                  return _movieCard(context, movie);
                },
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _sectionTitle(String title, BuildContext context, Widget nextPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => nextPage),
            );
          },
          child: Row(
            children: const [
              Text('See all', style: TextStyle(color: Colors.blue)),
              Icon(Icons.chevron_right, color: Colors.blue, size: 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _movieCard(BuildContext context, MovieModel movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movie)),
        );
      },
      child: SizedBox(
        width: 140,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                movie.posterUrl,
                height: 150,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,

              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ).apply(overflow: TextOverflow.ellipsis),
            ),
            // Text(
            //   '( '2001'})',
            //   style: GoogleFonts.poppins(color: Colors.grey),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.home, color: Colors.blue, size: 32),
          Icon(Icons.favorite_border, color: Colors.white, size: 32),
          Icon(Icons.person_outline, color: Colors.white, size: 32),
        ],
      ),
    );
  }
}
