import 'package:day_3/model/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllMoviesGrid extends StatefulWidget {
  final List<MovieModel> movies;

  const AllMoviesGrid({super.key, required this.movies});

  @override
  State<AllMoviesGrid> createState() => _AllMoviesAllMoviesGridState();
}

class _AllMoviesAllMoviesGridState extends State<AllMoviesGrid> {
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
        child: GridView.builder(
          padding: EdgeInsets.zero,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: widget.movies.length,

          itemBuilder: (ctx, index) {
            final model = widget.movies.elementAt(index);
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    model.posterUrl,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                ),

                Text(
                  model.title,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                  ).apply(overflow: TextOverflow.ellipsis),
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
