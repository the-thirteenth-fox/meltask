import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meltask/data/news_repository_core/news_repository_core.dart';
import 'package:meltask/models/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({required this.newsRepository}) : super(NewsInitial()) {
    on<NewsRequsted>(_onNewsRequstedToState);
  }

  void _onNewsRequstedToState(NewsEvent event, Emitter<NewsState> emit) async {
    List<NewsEntity>? newsEntities =
        await newsRepository.getCurrentNews((event as NewsRequsted).query);

    emit(newsEntities == null
        ? NewsLoadFailure()
        : NewsLoadSucces(
            newsEntities.map((news) => News.fromEntity(news)).toList()));
  }
}
