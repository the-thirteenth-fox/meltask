// To parse this JSON data, do
//
//     final newsEntity = newsEntityFromJson(jsonString);

import 'dart:convert';

NewsApiEntity newsApiEntityFromJson(String str) =>
    NewsApiEntity.fromJson(json.decode(str));

String newsApiEntityToJson(NewsApiEntity data) => json.encode(data.toJson());

class NewsApiEntity {
  NewsApiEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsApiEntity copyWith({
    required String status,
    required int totalResults,
    required List<Article> articles,
  }) =>
      NewsApiEntity(
        status: status,
        totalResults: totalResults,
        articles: articles,
      );

  factory NewsApiEntity.fromJson(Map<String, dynamic> json) => NewsApiEntity(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final Source source;
  String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  String? content;

  Article copyWith({
    required Source source,
    String? author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required DateTime publishedAt,
    String? content,
  }) =>
      Article(
        source: source,
        author: author ?? source.name,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
      );

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
