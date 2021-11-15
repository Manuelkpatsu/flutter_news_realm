import 'dart:async';

import 'package:flutternewsrealm/repository/news_api_repository.dart';

import 'news_tile_model_data.dart';

class NewsDomainModel {
  final _sharedNewsController = StreamController<List<NewsTileModelData>>();
  final NewsApiRepository _newsApiRepository;

  NewsDomainModel(this._newsApiRepository);

  Stream<List<NewsTileModelData>> getNewsTileModelDataListStream(String category) {
    if (!_sharedNewsController.hasListener) {
      _refreshData(category);
    }
    return _sharedNewsController.stream.distinct();
  }

  void _refreshData(String category) {
    _newsApiRepository.fetchNews(category: category).then((articles) {
      List<NewsTileModelData> newsList = articles!
          .map((article) => NewsTileModelData(
                author: article.author ?? '',
                title: article.title ?? '',
                description: article.description ?? '',
                url: article.url ?? '',
                urlToImage: article.urlToImage ?? '',
                publishedAt: article.publishedAt!,
                content: article.content ?? '',
              ))
          .toList();
      _sharedNewsController.add(newsList);
    });
  }

  void dispose() {
    _sharedNewsController.close();
  }
}
