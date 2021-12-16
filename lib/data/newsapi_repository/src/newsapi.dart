import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meltask/data/news_repository_core/news_repository_core.dart';

import 'newsapi_entity.dart';

class NewsAPI implements NewsRepository {
  @override
  Future<List<NewsEntity>?> getCurrentNews(String query) async {
    http.Response response = await _fetchResults(query);

    if (response.statusCode == 200) {
      try {
        return newsApiEntityFromJson(response.body)
            .articles
            .map((article) => NewsEntity.fromNewsApiEntity(article))
            .toList();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return null;
  }

  Future<http.Response> _fetchResults(String query) async {
    const String key = '1609bafc1ebd45e69a968f3c4d32a1f7';
    const String category = 'technology';

    final Uri defaultUrl = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$key');
    final Uri searchingUrl =
        Uri.parse('https://newsapi.org/v2/everything?q=$query&apiKey=$key');

    final Uri url = (query.isEmpty) ? defaultUrl : searchingUrl;

    return await http.get(url);
  }
}
