import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'news_tile_model_data.dart';

@immutable
class SharedNewsModelData extends Equatable {
  final List<NewsTileModelData> news;

  const SharedNewsModelData({this.news = const []});

  @override
  List<Object?> get props => [news];
}
