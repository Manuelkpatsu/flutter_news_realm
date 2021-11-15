import 'package:flutter/material.dart';
import 'package:flutternewsrealm/view/screens/shared/news_tile_model_data.dart';
import 'package:logger/logger.dart';

import 'shared_news_domain_model.dart';

class SharedNewsBloc extends ValueNotifier<List<NewsTileModelData>> {
  final _logger = Logger();
  final String _category;
  final NewsDomainModel _newsDomainModel;

  SharedNewsBloc(
    this._category,
    this._newsDomainModel,
  ) : super([]) {
    _newsDomainModel.getNewsTileModelDataListStream(_category).listen((articles) {
      value = articles;
    }).onError((error) {
      _logger.e('Error responding to event', error);
    });
  }

  @override
  void dispose() {
    _newsDomainModel.dispose();
    super.dispose();
  }
}
