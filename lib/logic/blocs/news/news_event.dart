part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class NewsRequsted extends NewsEvent {
  final String query;

  const NewsRequsted([this.query = '']);

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'New news request: {name:$query}';
}
