import 'dart:async';

import 'package:logger/logger.dart';

import '../flow_coordinator.dart';
import 'news_tile_event.dart';

class NewsTileBloc {
  final logger = Logger();
  final StreamController<NewsTileEvent> _eventController;
  final FlowCoordinator _flowCoordinator;

  NewsTileBloc(this._eventController, this._flowCoordinator) {
    _eventController.stream.listen((event) {
      _handleEvent(event);
    }).onError((error) {
      logger.e('An error occurred', error);
    });
  }

  /// Handles a [NewsTileEvent]
  _handleEvent(NewsTileEvent event) {
    switch (event.runtimeType) {
      case GoToViewDetailedScreenEvent:
        _flowCoordinator.goToViewDetailedScreen();
        break;
    }
  }

  void dispose() {
    _eventController.close();
  }
}
