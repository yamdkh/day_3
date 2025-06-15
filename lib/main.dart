import 'package:day_3/data_layer/dummy_data.dart';
import 'package:day_3/model/enum_types.dart';
import 'package:day_3/screens/HomeScreen.dart';
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


