part of 'favoritesnews_bloc.dart';

abstract class FavoritesNewsEvent extends Equatable {
  const FavoritesNewsEvent();

  @override
  List<Object> get props => [];
}

class FavoritesNewsRequsted extends FavoritesNewsEvent {
  final String query;

  const FavoritesNewsRequsted([this.query = '']);

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'New favoritesNews request: {query:$query}';
}

class FavoritesNewsDeleted extends FavoritesNewsEvent {
  final News news;

  const FavoritesNewsDeleted(this.news);

  @override
  List<Object> get props => [news];

  @override
  String toString() => 'FavoritesNewsDeleted(news: $news)';
}

class FavoritesNewsAdded extends FavoritesNewsEvent {
  final News news;

  const FavoritesNewsAdded(this.news);

  @override
  List<Object> get props => [news];

  @override
  String toString() => 'FavoritesNewsAdded(news: $news)';
}
