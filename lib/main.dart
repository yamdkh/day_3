import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'model/movie_details_model.dart';

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

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static List<Map<String, dynamic>> popularMovies = [
    {
      "id": 1,
      "title": "Inside Out",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZTgwNjU5OTg2NDE@._V1_SX300.jpg",
      "imdbId": "tt2096673",
    },
    {
      "id": 2,
      "title": "Coco",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BYjQ5NjM0Y2YtNjZkNC00ZDhkLWJjMWItN2QyNzFkMDE3ZjAxXkEyXkFqcGdeQXVyODIxMzk5NjA@._V1_SX300.jpg",
      "imdbId": "tt2380307",
    },
    {
      "id": 3,
      "title": "Incredibles 2",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTEzNzY0OTg0NTdeQTJeQWpwZ15BbWU4MDU3OTg3MjUz._V1_SX300.jpg",
      "imdbId": "tt3606756",
    },
    {
      "id": 4,
      "title": "Snow White and the Seven Dwarfs",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTQwMzE2Mzc4M15BMl5BanBnXkFtZTcwMTE4NTc1Nw@@._V1_SX300.jpg",
      "imdbId": "tt0029583",
    },
    {
      "id": 5,
      "title": "Zootopia",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BOTMyMjEyNzIzMV5BMl5BanBnXkFtZTgwNzIyNjU0NzE@._V1_SX300.jpg",
      "imdbId": "tt2948356",
    },
    {
      "id": 6,
      "title": "Toy Story 2",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMWM5ZDcxMTYtNTEyNS00MDRkLWI3YTItNThmMGExMWY4NDIwXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg",
      "imdbId": "tt0120363",
    },
    {
      "id": 7,
      "title": "Up",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTk3NDE2NzI4NF5BMl5BanBnXkFtZTgwNzE1MzEyMTE@._V1_SX300.jpg",
      "imdbId": "tt1049413",
    },
    {
      "id": 8,
      "title": "Toy Story 3",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTgxOTY4Mjc0MF5BMl5BanBnXkFtZTcwNTA4MDQyMw@@._V1_SX300.jpg",
      "imdbId": "tt0435761",
    },
    {
      "id": 9,
      "title": "Finding Nemo",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BZTAzNWZlNmUtZDEzYi00ZjA5LWIwYjEtZGM1NWE1MjE4YWRhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
      "imdbId": "tt0266543",
    },
    {
      "id": 10,
      "title": "Finding Dory",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNzg4MjM2NDQ4MV5BMl5BanBnXkFtZTgwMzk3MTgyODE@._V1_SX300.jpg",
      "imdbId": "tt2277860",
    },
    {
      "id": 11,
      "title": "Pinocchio",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTU4Mzk3ODIyOF5BMl5BanBnXkFtZTgwODgyNzk2NjE@._V1_SX300.jpg",
      "imdbId": "tt0032910",
    },
    {
      "id": 12,
      "title": "Moana",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMjI4MzU5NTExNF5BMl5BanBnXkFtZTgwNzY1MTEwMDI@._V1_SX300.jpg",
      "imdbId": "tt3521164",
    },
    {
      "id": 13,
      "title": "Toy Story",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_SX300.jpg",
      "imdbId": "tt0114709",
    },
    {
      "id": 14,
      "title": "Kubo and the Two Strings",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMjA2Mzg2NDMzNl5BMl5BanBnXkFtZTgwMjcwODUzOTE@._V1_SX300.jpg",
      "imdbId": "tt4302938",
    },
    {
      "id": 15,
      "title": "How to Train Your Dragon",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMjA5NDQyMjc2NF5BMl5BanBnXkFtZTcwMjg5ODcyMw@@._V1_SX300.jpg",
      "imdbId": "tt0892769",
    },
    {
      "id": 16,
      "title": "Shaun the Sheep Movie",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BOTc1ODY5MTQ1Nl5BMl5BanBnXkFtZTgwMDM5ODI1NjE@._V1_SX300.jpg",
      "imdbId": "tt2872750",
    },
    {
      "id": 17,
      "title": "Isle of Dogs",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTYyOTUwNjAxM15BMl5BanBnXkFtZTgwODcyMzE0NDM@._V1_SX300.jpg",
      "imdbId": "tt5104604",
    },
    {
      "id": 18,
      "title": "Dumbo",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNWVmNWQ2OTQtNzJlNC00ZmQwLTg4ZTktZTNmM2IxZTlkOGM3L2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",
      "imdbId": "tt0033563",
    },
    {
      "id": 19,
      "title": "WALL-E",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_SX300.jpg",
      "imdbId": "tt0910970",
    },
    {
      "id": 20,
      "title": "The Lego Movie",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTg4MDk1ODExN15BMl5BanBnXkFtZTgwNzIyNjg3MDE@._V1_SX300.jpg",
      "imdbId": "tt1490017",
    },
    {
      "id": 21,
      "title": "Ratatouille",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTMzODU0NTkxMF5BMl5BanBnXkFtZTcwMjQ4MzMzMw@@._V1_SX300.jpg",
      "imdbId": "tt0382932",
    },
    {
      "id": 22,
      "title": "The Incredibles",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTY5OTU0OTc2NV5BMl5BanBnXkFtZTcwMzU4MDcyMQ@@._V1_SX300.jpg",
      "imdbId": "tt0317705",
    },
    {
      "id": 23,
      "title": "Only Yesterday",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTY5NjI2MjQxMl5BMl5BanBnXkFtZTgwMDA2MzM2NzE@._V1_SX300.jpg",
      "imdbId": "tt0102587",
    },
    {
      "id": 24,
      "title": "Yellow Submarine",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMGExODFmMjQtZTgxOC00ZDE0LWJmM2MtOTQzM2YzNDZlMzNmL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg",
      "imdbId": "tt0063823",
    },
    {
      "id": 25,
      "title": "Beauty and the Beast",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMzE5MDM1NDktY2I0OC00YWI5LTk2NzUtYjczNDczOWQxYjM0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
      "imdbId": "tt0101414",
    },
    {
      "id": 26,
      "title": "Chicken Run",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BY2UyYjFkNzAtYzIyMC00MGI1LTlkNDktNzUyOGQ5NTI2ZGFjXkEyXkFqcGdeQXVyNTUyMzE4Mzg@._V1_SX300.jpg",
      "imdbId": "tt0120630",
    },
    {
      "id": 27,
      "title": "The Lego Batman Movie",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg",
      "imdbId": "tt4116284",
    },
    {
      "id": 28,
      "title": "The Nightmare Before Christmas",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNWE4OTNiM2ItMjY4Ni00ZTViLWFiZmEtZGEyNGY2ZmNlMzIyXkEyXkFqcGdeQXVyMDU5NDcxNw@@._V1_SX300.jpg",
      "imdbId": "tt0107688",
    },
    {
      "id": 29,
      "title": "Monsters, Inc.",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTY1NTI0ODUyOF5BMl5BanBnXkFtZTgwNTEyNjQ0MDE@._V1_SX300.jpg",
      "imdbId": "tt0198781",
    },
    {
      "id": 30,
      "title": "The Iron Giant",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMjIxNDU2Njk0OV5BMl5BanBnXkFtZTgwODc3Njc3NjE@._V1_SX300.jpg",
      "imdbId": "tt0129167",
    },
    {
      "id": 31,
      "title": "Tower",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNjI1Nzg3NTgyOV5BMl5BanBnXkFtZTgwNzIwMjIxMDI@._V1_SX300.jpg",
      "imdbId": "tt5116410",
    },
    {
      "id": 32,
      "title": "Anomalisa",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTkyMzI2MzQ1N15BMl5BanBnXkFtZTgwNDg0MzQxNzE@._V1_SX300.jpg",
      "imdbId": "tt2401878",
    },
    {
      "id": 33,
      "title": "Song of the Sea",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTQ2MDMwNjEwNV5BMl5BanBnXkFtZTgwOTkxMzI0MzE@._V1_SX300.jpg",
      "imdbId": "tt1865505",
    },
    {
      "id": 34,
      "title": "The Lion King",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_SX300.jpg",
      "imdbId": "tt0110357",
    },
    {
      "id": 35,
      "title": "Who Framed Roger Rabbit",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMDhiOTM2OTctODk3Ny00NWI4LThhZDgtNGQ4NjRiYjFkZGQzXkEyXkFqcGdeQXVyMTA0MjU0Ng@@._V1_SX300.jpg",
      "imdbId": "tt0096438",
    },
    {
      "id": 36,
      "title": "Waltz with Bashir",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNjM2OTI3NzQyNl5BMl5BanBnXkFtZTcwNjkzNzQ5MQ@@._V1_SX300.jpg",
      "imdbId": "tt1185616",
    },
    {
      "id": 37,
      "title": "Persepolis",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMGRkZThmYzEtYjQxZC00OWEzLThjYjAtYzFkMjY0NGZkZWI4XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",
      "imdbId": "tt0808417",
    },
    {
      "id": 38,
      "title": "Wallace & Gromit: The Curse of the Were-Rabbit",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTk1NzIwNTM1NV5BMl5BanBnXkFtZTcwMDA1NzkyMw@@._V1_SX300.jpg",
      "imdbId": "tt0312004",
    },
    {
      "id": 39,
      "title": "Fantasia",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BYjhlYzNkOGEtZjNkZC00OTQ4LWJiMzEtMTM3YzBiM2FkMDUxXkEyXkFqcGdeQXVyNzY1NDgwNjQ@._V1_SX300.jpg",
      "imdbId": "tt0032455",
    },
    {
      "id": 40,
      "title": "Fantastic Mr. Fox",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BOGUwYTU4NGEtNDM4MS00NDRjLTkwNmQtOTkwMWMyMjhmMjdlXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
      "imdbId": "tt0432283",
    },
    {
      "id": 41,
      "title": "Aladdin",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BY2Q2NDI1MjUtM2Q5ZS00MTFlLWJiYWEtNTZmNjQ3OGJkZDgxXkEyXkFqcGdeQXVyNTI4MjkwNjA@._V1_SX300.jpg",
      "imdbId": "tt0103639",
    },
    {
      "id": 42,
      "title": "Frozen",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTQ1MjQwMTE5OF5BMl5BanBnXkFtZTgwNjk3MTcyMDE@._V1_SX300.jpg",
      "imdbId": "tt2294629",
    },
    {
      "id": 43,
      "title": "How to Train Your Dragon 2",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMzMwMTAwODczN15BMl5BanBnXkFtZTgwMDk2NDA4MTE@._V1_SX300.jpg",
      "imdbId": "tt1646971",
    },
    {
      "id": 44,
      "title": "The Breadwinner",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMWM2MzQ4YTAtMTBkZS00ODA1LWFmNTEtMjEwNzk3ZGJiZDc3XkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_SX300.jpg",
      "imdbId": "tt3901826",
    },
    {
      "id": 45,
      "title": "Coraline",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMzQxNjM5NzkxNV5BMl5BanBnXkFtZTcwMzg5NDMwMg@@._V1_SX300.jpg",
      "imdbId": "tt0327597",
    },
    {
      "id": 46,
      "title": "The Little Mermaid",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BN2JlZTBhYTEtZDE3OC00NTA3LTk5NTQtNjg5M2RjODllM2M0XkEyXkFqcGdeQXVyNjk1Njg5NTA@._V1_SX300.jpg",
      "imdbId": "tt0097757",
    },
    {
      "id": 47,
      "title": "Lady and the Tramp",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BYTI1ZDc1OTItM2EzNS00ODMxLWIxYzctOTc5YWNiYzI3NGZiXkEyXkFqcGdeQXVyNDE5MTU2MDE@._V1_SX300.jpg",
      "imdbId": "tt0048280",
    },
    {
      "id": 48,
      "title": "Antz",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMzMzMDdlMDktODg4OC00Y2E5LTk1ZjMtNzM2MzIxZGQ0ZGI3XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
      "imdbId": "tt0120587",
    },
    {
      "id": 49,
      "title": "The Triplets of Belleville",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMjAzMzUxNzc5M15BMl5BanBnXkFtZTgwODc2NDE2MDE@._V1_SX300.jpg",
      "imdbId": "tt0286244",
    },
    {
      "id": 50,
      "title": "Bambi",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTY1NzM4NDg5MV5BMl5BanBnXkFtZTgwMjI1MTkzMjE@._V1_SX300.jpg",
      "imdbId": "tt0034492",
    },
    {
      "id": 51,
      "title": "My Neighbor Totoro",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNTdiOTQ0YmUtOGE3YS00NDg5LWI3YTEtNDAxZmE0MzRmZWM5L2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",
      "imdbId": "tt0096283",
    },
    {
      "id": 52,
      "title": "Big Hero 6",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMDliOTIzNmUtOTllOC00NDU3LWFiNjYtMGM0NDc1YTMxNjYxXkEyXkFqcGdeQXVyNTM3NzExMDQ@._V1_SX300.jpg",
      "imdbId": "tt2245084",
    },
    {
      "id": 53,
      "title": "Arthur Christmas",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTYyMjMyMzEzMl5BMl5BanBnXkFtZTcwMDg4NTM5Ng@@._V1_SX300.jpg",
      "imdbId": "tt1430607",
    },
    {
      "id": 54,
      "title": "A Bug's Life",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNThmZGY4NzgtMTM4OC00NzNkLWEwNmEtMjdhMGY5YTc1NDE4XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
      "imdbId": "tt0120623",
    },
    {
      "id": 55,
      "title": "Mary and Max",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMDgzYjQwMDMtNGUzYi00MTRmLWIyMGMtNjE1OGZkNzY2YWIzL2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
      "imdbId": "tt0978762",
    },
    {
      "id": 56,
      "title": "Teen Titans Go! To the Movies",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BOTZhMTIwZDUtYjZjZS00MmViLTg3NzEtNWE5NzI1NDUwNDJmXkEyXkFqcGdeQXVyODQxMTI4MjM@._V1_SX300.jpg",
      "imdbId": "tt7424200",
    },
    {
      "id": 57,
      "title": "Bolt",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNDQyNDE5NjQ1N15BMl5BanBnXkFtZTcwMDExMTAwMg@@._V1_SX300.jpg",
      "imdbId": "tt0397892",
    },
    {
      "id": 58,
      "title": "Shrek 2",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMDJhMGRjN2QtNDUxYy00NGM3LThjNGQtMmZiZTRhNjM4YzUxL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
      "imdbId": "tt0298148",
    },
    {
      "id": 59,
      "title": "Tangled",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTAxNDYxMjg0MjNeQTJeQWpwZ15BbWU3MDcyNTk2OTM@._V1_SX300.jpg",
      "imdbId": "tt0398286",
    },
    {
      "id": 60,
      "title": "The Simpsons Movie",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTgxMDczMTA5N15BMl5BanBnXkFtZTcwMzk1MzMzMw@@._V1_SX300.jpg",
      "imdbId": "tt0462538",
    },
    {
      "id": 61,
      "title": "James and the Giant Peach",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTNkNWIwNGUtNTJlOC00NDU3LTk0NWEtNjNjNDM4NzRiNThkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
      "imdbId": "tt0116683",
    },
    {
      "id": 62,
      "title": "Shrek",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BOGZhM2FhNTItODAzNi00YjA0LWEyN2UtNjJlYWQzYzU1MDg5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
      "imdbId": "tt0126029",
    },
    {
      "id": 63,
      "title": "Frankenweenie",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BY2UwYWI3MTktM2MxNC00MjRhLTlkMWEtYTNjMjRkOTIwOTkyXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",
      "imdbId": "tt1142977",
    },
    {
      "id": 64,
      "title": "Sleeping Beauty",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BOTJmZjA3MjMtMWNmZS00YTliLWFhMWUtZDU2NGJhNTlmY2ZkL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
      "imdbId": "tt0053285",
    },
    {
      "id": 65,
      "title": "Rango",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTc4NjEyODE1OV5BMl5BanBnXkFtZTcwMjYzNTkxNA@@._V1_SX300.jpg",
      "imdbId": "tt1192628",
    },
    {
      "id": 66,
      "title": "Winnie the Pooh",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BYzBlYTJkMGQtYzQ4MS00Zjk3LTk4MmEtYTZiNTEzNmRlMjUxXkEyXkFqcGdeQXVyMzI0NDc4ODY@._V1_SX300.jpg",
      "imdbId": "tt1449283",
    },
    {
      "id": 67,
      "title": "ParaNorman",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMjA1OTU1NDM3N15BMl5BanBnXkFtZTcwMjYxNTg0Nw@@._V1_SX300.jpg",
      "imdbId": "tt1623288",
    },
    {
      "id": 68,
      "title": "The Peanuts Movie",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNTE5NzMxNzkwNl5BMl5BanBnXkFtZTgwOTQ0Nzk5NzE@._V1_SX300.jpg",
      "imdbId": "tt2452042",
    },
    {
      "id": 69,
      "title": "Kung Fu Panda",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg",
      "imdbId": "tt0441773",
    },
    {
      "id": 70,
      "title": "Tarzan",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BY2ZiYWUxN2ItYmQxZi00NDlkLWE2NDAtOTNmYTg1MDI0NDk1XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg",
      "imdbId": "tt0120855",
    },
    {
      "id": 71,
      "title": "Wreck-It Ralph",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNzMxNTExOTkyMF5BMl5BanBnXkFtZTcwMzEyNDc0OA@@._V1_SX300.jpg",
      "imdbId": "tt1772341",
    },
    {
      "id": 72,
      "title": "Kung Fu Panda 3",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMTUyNzgxNjg2M15BMl5BanBnXkFtZTgwMTY1NDI1NjE@._V1_SX300.jpg",
      "imdbId": "tt2267968",
    },
    {
      "id": 73,
      "title": "Sausage Party",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMjkxOTk1MzY4MF5BMl5BanBnXkFtZTgwODQzOTU5ODE@._V1_SX300.jpg",
      "imdbId": "tt1700841",
    },
    {
      "id": 74,
      "title": "Akira",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BM2ZiZTk1ODgtMTZkNS00NTYxLWIxZTUtNWExZGYwZTRjODViXkEyXkFqcGdeQXVyMTE2MzA3MDM@._V1_SX300.jpg",
      "imdbId": "tt0094625",
    },
    {
      "id": 75,
      "title": "Tokyo Godfathers",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BYmJmMjFiY2ItNDBkZS00MGQyLWE3ZjQtZWMzNjQ5ZTA5YjcwL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg",
      "imdbId": "tt0388473",
    },
    {
      "id": 76,
      "title": "The Pirates! Band of Misfits",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BNDhkOGZkZWMtNGI4Mi00ZWI3LTgyYTgtMDU4ZDI3NTNjMWFiXkEyXkFqcGdeQXVyNjk1Njg5NTA@._V1_SX300.jpg",
      "imdbId": "tt1430626",
    },
    {
      "id": 77,
      "title": "The Princess and the Frog",
      "posterURL":
          "https://m.media-amazon.com/images/M/MV5BMjEyOTQ5NzAzNl5BMl5BanBnXkFtZTcwMTcyNTU1Mg@@._V1_SX300.jpg",
      "imdbId": "tt0780521",
    },
  ]..shuffle();

  final List<Map<String, dynamic>> trendingMovies = popularMovies..shuffle();

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
            _sectionTitle('Popular', context),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: popularMovies.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final movie = popularMovies[index];
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
          onPressed: () {},
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

  Widget _movieCard(BuildContext context, Map<String, dynamic> movie) {
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
                movie['posterURL']!,
                height: 150,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie['title']!,

              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ).apply(overflow: TextOverflow.ellipsis),
            ),
            Text(
              '(${movie['year'] ?? '2001'})',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
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
  final Map<String, dynamic> movie;

  MovieDetailScreen({super.key, required this.movie}) {
    // movieDetai();
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

  movieDetai() async {
    final api = 'http://www.omdbapi.com/?i=tt1772341&apikey=22bf21a&=';

    var url = Uri.https('omdbapi.com', '', {
      "i": "tt1772341",
      "apikey": "22bf21a",
    });
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }

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
