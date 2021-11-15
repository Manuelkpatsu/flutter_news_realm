import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../locator.dart';
import 'news_tile_bloc.dart';
import 'news_tile_event.dart';
import 'news_tile_model_data.dart';

class NewsTile extends StatelessWidget {
  late final NewsTileBloc bloc;
  final eventController = StreamController<NewsTileEvent>();
  final NewsTileModelData _modelData;

  NewsTile(BuildContext context, this._modelData) : super(key: ValueKey(_modelData.url)) {
    bloc = get<NewsTileBloc>(param1: context, param2: eventController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        eventController.add(GoToViewDetailedScreenEvent());
      },
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image(),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _category(),
                    _title(),
                    _duration(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: _modelData.urlToImage != ''
          ? FadeInImage.assetNetwork(
              placeholder: 'assets/images/image-placeholder.png',
              image: _modelData.urlToImage,
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/images/image-placeholder.png',
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _category() {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(3),
        color: Colors.red,
        child: Text(
          _modelData.category.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      _modelData.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }

  Widget _duration() {
    return Text(
      timeago.format(_modelData.publishedAt, locale: 'en_short'),
      style: const TextStyle(fontSize: 12),
    );
  }
}
