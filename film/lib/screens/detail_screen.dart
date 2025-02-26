import 'package:film/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:film/models/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                height: 300,
              ),
              const SizedBox(height: 20),

              Text(
                'Overview: ${movie.overview}',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(movie.overview),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.calendar_month, color: Colors.blue),
                  const SizedBox(width: 10),
                  const Text('Release Date:', 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Text(movie.releaseDate),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 10),
                  const Text('Rating:', 
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Text(movie.voteAverage.toString()),
                ],
              ),

              Text(movie.releaseDate),
              Text(
                'Title: ${movie.title}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),

              Text(
                'Release Date: ${movie.releaseDate}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),

            ],
          ),
        ),
      ),
    );
  }
}
