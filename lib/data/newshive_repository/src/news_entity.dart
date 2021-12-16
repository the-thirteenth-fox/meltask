import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meltask/data/news_repository_core/news_repository_core.dart';

part 'news_entity.g.dart';

@HiveType(typeId: 0)
class NewsHiveEntity extends Equatable {
  const NewsHiveEntity({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  @HiveField(0)
  final String sourceName;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final String urlToImage;
  @HiveField(6)
  final DateTime publishedAt;

  @override
  List<Object> get props {
    return [
      sourceName,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
    ];
  }

  NewsHiveEntity copyWith({
    String? sourceName,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
  }) {
    return NewsHiveEntity(
      sourceName: sourceName ?? this.sourceName,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sourceName': sourceName,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.millisecondsSinceEpoch,
    };
  }

  factory NewsHiveEntity.fromMap(Map<String, dynamic> map) {
    return NewsHiveEntity(
      sourceName: map['sourceName'] ?? '',
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: DateTime.fromMillisecondsSinceEpoch(map['publishedAt']),
    );
  }

  factory NewsHiveEntity.fromNewsEntity(NewsEntity news) {
    return NewsHiveEntity(
      sourceName: news.sourceName,
      author: news.author,
      title: news.title,
      description: news.description,
      url: news.url,
      urlToImage: news.urlToImage,
      publishedAt: news.publishedAt,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsHiveEntity.fromJson(String source) =>
      NewsHiveEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsHiveEntity(sourceName: $sourceName, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt,)';
  }
}
