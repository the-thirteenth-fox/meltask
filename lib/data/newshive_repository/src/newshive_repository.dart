import 'package:hive_flutter/hive_flutter.dart';
import 'package:meltask/data/news_repository_core/news_repository_core.dart';

import '../newshive.dart';

class NewsHive implements NewsStorageRepository {
  Box? _favoritesNews;
  bool _init = false;

  @override
  Future<void> addFavoriteNews(NewsEntity news) {
    return save(newsHiveEntities..add(NewsHiveEntity.fromNewsEntity(news)));
  }

  @override
  Future<void> deleteFavoriteNews(NewsEntity news) {
    return save(newsHiveEntities
      ..removeWhere((n) => n.title == news.title)
      ..toList());
  }

  @override
  Future<List<NewsEntity>?> getCurrentNews(String query) async {
    if (!_init) {
      await init;
      _init = true;
    }

    final List<NewsEntity> _news =
        newsHiveEntities.map((news) => NewsEntity.fromHiveNews(news)).toList();

    return (query.isEmpty)
        ? _news
        : _news
            .where((element) =>
                element.title.contains(query) ||
                element.description.contains(query))
            .toList();
  }

  Future get init async {
    await Hive.initFlutter();
    Hive.registerAdapter(NewsHiveEntityAdapter());
    _favoritesNews ??= await Hive.openBox('favoritesNews');
  }

  Future save(List<NewsHiveEntity> newsHive) async {
    await _favoritesNews!.put('favs', newsHive);
  }

  List<NewsHiveEntity> get newsHiveEntities {
    final List<dynamic> _hiveNews =
        _favoritesNews!.get('favs', defaultValue: []) ?? [];

    return _hiveNews.map((e) => e as NewsHiveEntity).toList();
  }
}
