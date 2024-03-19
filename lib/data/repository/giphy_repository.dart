import 'dart:convert';

import 'package:sample/data/model/GifResponse.dart';
import 'package:http/http.dart' as http;

class GiphyRepository {
  final String _apiKey = "Rhb7ZYCR44EXskl8aNBxtFHtD0zIRomw";
  final String _baseUrl = "https://api.giphy.com/v1/gifs";
  final String _trendingUrl = "/trending";
  final String _searchUrl = "/search";

  Future<List<Data>> fetchTrendingGifs(int offset) async {
    Uri uri = Uri.parse(
        '${_baseUrl}${_trendingUrl}?api_key=${_apiKey}&limit=20&offset=${offset}');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Data.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load trending gifs');
    }
  }

  Future<List<Data>> searchGifs(String query, int offset) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl$_trendingUrl?api_key=$_apiKey&limit=20&offset=$offset&q=$query'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Data.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
