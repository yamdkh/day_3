import 'package:day_3/model/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllMovies extends StatefulWidget {
  final List<MovieModel> movies;

  const AllMovies({super.key, required this.movies});

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Movies',
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
        child: ListView.builder(
          itemCount: widget.movies.length,

          itemBuilder: (ctx, index) {
            final model = widget.movies.elementAt(index);
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    model.posterUrl,
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
                            // textIcon(model.language, Icons.language),
                            // textIcon(model.runtime, Icons.access_time_outlined),
                            // textIcon('${model.imdbRating}/10', Icons.star),
                          ],
                        ),
                      ),

                      Text(
                        model.title,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                ),

                // Text(model.plot),
              ],
            );
          },
        ),
      ),
    );
  }
}
