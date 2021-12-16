import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meltask/data/news_repository_core/news_repository_core.dart';

class News extends Equatable {
  const News({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
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

  News copyWith({
    String? sourceName,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
  }) {
    return News(
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

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      sourceName: map['sourceName'] ?? '',
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: DateTime.fromMillisecondsSinceEpoch(map['publishedAt']),
    );
  }

  factory News.fromEntity(NewsEntity newsEntity) {
    return News(
      sourceName: newsEntity.sourceName,
      author: newsEntity.author,
      title: newsEntity.title,
      description: newsEntity.description,
      url: newsEntity.url,
      urlToImage: newsEntity.urlToImage,
      publishedAt: newsEntity.publishedAt,
    );
  }

  NewsEntity toEntity() {
    return NewsEntity(
      sourceName: sourceName,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(sourceName: $sourceName, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt,)';
  }
}
