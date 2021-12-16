part of 'favoritesnews_bloc.dart';

abstract class FavoritesNewsState extends Equatable {
  const FavoritesNewsState();

  @override
  List<Object> get props => [];
}

class FavoritesNewsInitial extends FavoritesNewsState {}

class FavoritesNewsLoadInProgress extends FavoritesNewsState {}

class FavoritesNewsLoadSucces extends FavoritesNewsState {
  final List<News> news;

  const FavoritesNewsLoadSucces(this.news);

  @override
  List<Object> get props => [news];

  @override
  String toString() => 'favoritesNewsStateLoadSucces: {news: $news}';
}

class FavoritesNewsLoadFailure extends FavoritesNewsState {}
