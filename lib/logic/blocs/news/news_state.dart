part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoadInProgress extends NewsState {}

class NewsLoadSucces extends NewsState {
  final List<News> news;

  const NewsLoadSucces(this.news);

  @override
  List<Object> get props => [news];

  @override
  String toString() => 'newsLoadSucces: {news: $news}';
}

class NewsLoadFailure extends NewsState {}
