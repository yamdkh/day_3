import 'package:day_3/data_layer/dummy_data.dart';
import 'package:day_3/model/enum_types.dart';
import 'package:day_3/screens/all_movies.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'data_layer/data_src.dart';
import 'model/movie_details_model.dart';
import 'model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

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
            _sectionTitle('Popular', context),
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
            _sectionTitle('Trending', context),
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

  Widget _sectionTitle(String title, BuildContext context) {
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
              MaterialPageRoute(
                builder: (ctx) => AllMovies(movies: dummyListMovie),
              ),
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

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;

  MovieDetailScreen({super.key, required this.movie}) {
    // movieDetai();

    getPopularMovieByTag('asdsa');
  }

  final MovieDetailsModel model = MovieDetailsModel.fromJson({
    "Title": "Wreck-It Ralph",
    "Year": "2012",
    "Rated": "PG",
    "Released": "02 Nov 2012",
    "Runtime": "101 min",
    "Genre": "Animation, Adventure, Comedy",
    "Director": "Rich Moore",
    "Writer": "Rich Moore, Phil Johnston, Jim Reardon",
    "Actors": "John C. Reilly, Jack McBrayer, Jane Lynch",
    "Plot":
        "Ralph is tired of playing the role of a bad guy and embarks on a journey to become a video game hero. But he accidentally lets loose a deadly enemy that threatens the entire arcade.",
    "Language": "English",
    "Country": "United States",
    "Awards": "Nominated for 1 Oscar. 33 wins & 42 nominations total",
    "Poster":
        "https://m.media-amazon.com/images/M/MV5BNzMxNTExOTkyMF5BMl5BanBnXkFtZTcwMzEyNDc0OA@@._V1_SX300.jpg",
    "Ratings": [
      {"Source": "Internet Movie Database", "Value": "7.7/10"},
      {"Source": "Rotten Tomatoes", "Value": "87%"},
      {"Source": "Metacritic", "Value": "72/100"},
    ],
    "Metascore": "72",
    "imdbRating": "7.7",
    "imdbVotes": "480,833",
    "imdbID": "tt1772341",
    "Type": "movie",
    "DVD": "N/A",
    "BoxOffice": r"$189,422,889",
    "Production": "N/A",
    "Website": "N/A",
    "Response": "True",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textStyle: TextStyle(color: Colors.black),
          ).apply(overflow: TextOverflow.ellipsis),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                model.poster,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8 * 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: GoogleFonts.roboto(
                      fontSize: 22,

                      fontWeight: FontWeight.w700,
                    ).apply(overflow: TextOverflow.ellipsis),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textIcon(model.language, Icons.language),
                        textIcon(model.runtime, Icons.access_time_outlined),
                        textIcon('${model.imdbRating}/10', Icons.star),
                      ],
                    ),
                  ),

                  Text(
                    model.plot,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
            ),

            // Text(model.plot),
          ],
        ),
      ),
    );
  }

  Widget textIcon(String title, IconData ic) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Icon(ic, color: Colors.blue),
      ],
    );
  }
}
