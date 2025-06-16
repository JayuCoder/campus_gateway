import 'dart:convert';
import 'package:campus_gateway/models/news_model.dart';
import 'package:http/http.dart' as http;
// import 'news_model.dart';

class NewsService {
  static const String _apiKey = 'KbonDrkNWEJMwYbBbNJAn2AVye3Iah9g';
  static const String _endpoint =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$_apiKey';

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse(_endpoint));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List articles = json['articles'];
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
