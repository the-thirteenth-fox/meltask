import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meltask/data/news_repository_core/news_repository_core.dart';
import 'package:meltask/models/news.dart';

part 'favoritesnews_event.dart';
part 'favoritesnews_state.dart';

class FavoritesNewsBloc extends Bloc<FavoritesNewsEvent, FavoritesNewsState> {
  final NewsStorageRepository newsRepository;

  FavoritesNewsBloc({required this.newsRepository})
      : super(FavoritesNewsInitial()) {
    on<FavoritesNewsRequsted>(_onFavNewsRequstedToState);
    on<FavoritesNewsAdded>(_onFavNewsAddedToState);
    on<FavoritesNewsDeleted>(_onFavNewsDeletedToState);
  }

  void _onFavNewsRequstedToState(
      FavoritesNewsEvent event, Emitter<FavoritesNewsState> emit) async {
    List<NewsEntity>? newsEntities = await newsRepository
        .getCurrentNews((event as FavoritesNewsRequsted).query);

    emit(newsEntities == null
        ? FavoritesNewsLoadFailure()
        : FavoritesNewsLoadSucces(
            newsEntities.map((news) => News.fromEntity(news)).toList()));
  }

  void _onFavNewsAddedToState(
      FavoritesNewsEvent event, Emitter<FavoritesNewsState> emit) async {
    if (state is FavoritesNewsLoadSucces) {
      final List<News> updatedNews =
          List.from((state as FavoritesNewsLoadSucces).news)
            ..add((event as FavoritesNewsAdded).news);
      emit(FavoritesNewsLoadSucces(updatedNews));
      await newsRepository.addFavoriteNews(event.news.toEntity());
    }
  }

  void _onFavNewsDeletedToState(
      FavoritesNewsEvent event, Emitter<FavoritesNewsState> emit) async {
    if (state is FavoritesNewsLoadSucces) {
      final List<News> updatedNews =
          List.from((state as FavoritesNewsLoadSucces).news)
            ..remove((event as FavoritesNewsDeleted).news);
      emit(FavoritesNewsLoadSucces(updatedNews));
      await newsRepository.deleteFavoriteNews(event.news.toEntity());
    }
  }
}
