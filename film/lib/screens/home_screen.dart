import 'package:flutter/material.dart';
import 'package:film/services/api_service.dart';
import 'package:film/models/movie.dart';
import 'package:film/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  List<Movie> allMovies = [];
  List<Movie> trendingMovies = [];
  List<Movie> popularMovies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    final List<Map<String, dynamic>> allMoviesData = await apiService.getAllMovies();
    final List<Map<String, dynamic>> trendingMoviesData = await apiService.getTrendingMovies();
    final List<Map<String, dynamic>> popularMoviesData = await apiService.getPopularMovies();

    setState(() {
      allMovies = allMoviesData.map((e) => Movie.fromJson(e)).toList();
      trendingMovies = trendingMoviesData.map((e) => Movie.fromJson(e)).toList();
      popularMovies = popularMoviesData.map((e) => Movie.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMoviesList(allMovies, 'All Movies'),
            buildMoviesList(trendingMovies, 'Trending Movies'),
            buildMoviesList(popularMovies, 'Popular Movies'),
          ],
        ),
      ),
    );
  }
}

Widget buildMoviesList(List<Movie> movies, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ),
        SizedBox(height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final Movie movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(movie: movie),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: 150,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 5),
                    Text(
                      movie.title.length > 14 ? '${movie.title.substring(0, 10)}...' : movie.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        ),
        ],
      );
}
