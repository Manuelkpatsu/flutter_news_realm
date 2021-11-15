import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutternewsrealm/repository/news_api_repository.dart';
import 'package:flutternewsrealm/view/screens/flow_coordinator.dart';
import 'package:flutternewsrealm/view/screens/shared/news_tile_bloc.dart';
import 'package:flutternewsrealm/view/screens/shared/news_tile_event.dart';
import 'package:flutternewsrealm/view/screens/shared/shared_news_bloc.dart';
import 'package:flutternewsrealm/view/screens/shared/shared_news_domain_model.dart';
import 'package:get_it/get_it.dart';

final GetIt get = GetIt.instance;

void setUpLocator() {
  get.registerFactory(() => NewsApiRepository());
  get.registerFactoryParam<MyFlowCoordinator, BuildContext, void>(
    (context, _) => MyFlowCoordinator(context),
  );

  /// SharedNewsScreen
  get.registerFactory(() => NewsDomainModel(get<NewsApiRepository>()));
  get.registerFactoryParam<SharedNewsBloc, BuildContext, String>(
    (context, category) => SharedNewsBloc(
      category,
      get<NewsDomainModel>(),
    ),
  );
  get.registerFactoryParam<NewsTileBloc, BuildContext, StreamController<NewsTileEvent>>(
    (context, eventController) => NewsTileBloc(
      eventController,
      get<MyFlowCoordinator>(param1: context),
    ),
  );
}
