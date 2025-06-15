import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data_layer/data_src.dart';
import '../model/movie_details_model.dart';
import '../model/movie_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieModel movie;

  MovieDetailScreen({super.key, required this.movie}) {
    // movieDetai();
  }

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailsModel? model;

  @override
  void initState() {
    movieDetailsByImdbId(widget.movie.imdbId).then((m) {
      setState(() {
        model = m;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return model == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
          appBar: AppBar(
            title: Text(
              model?.title ?? '',
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
                    model!.poster,
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
                        model!.title,
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
                            textIcon(model!.language, Icons.language),
                            textIcon(
                              model!.runtime,
                              Icons.access_time_outlined,
                            ),
                            textIcon('${model!.imdbRating}/10', Icons.star),
                          ],
                        ),
                      ),

                      Text(
                        model!.plot,
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
