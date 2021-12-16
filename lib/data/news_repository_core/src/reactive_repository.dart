import 'news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>?> getCurrentNews(String query);
}

abstract class NewsStorageRepository implements NewsRepository {
  Future<void> addFavoriteNews(NewsEntity news);
  Future<void> deleteFavoriteNews(NewsEntity news);
}
