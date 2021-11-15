import 'package:flutter/material.dart';

abstract class NewsTileEvent {}

@immutable
class GoToViewDetailedScreenEvent extends NewsTileEvent {
  GoToViewDetailedScreenEvent();
}

