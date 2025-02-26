import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = 'fb4aafea98433804a94bb2bef1401dbb';

  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/movie/now_playing?api_key=$_apiKey'));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

  Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/trending/movie/week?api_key=$_apiKey'));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);  
  }

  Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey'));
    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);  
  }    
}

