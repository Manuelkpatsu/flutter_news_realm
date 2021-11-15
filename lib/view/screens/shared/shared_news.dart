import 'package:flutter/material.dart';
import 'package:flutternewsrealm/view/screens/shared/news_tile.dart';
import 'package:flutternewsrealm/view/screens/shared/news_tile_model_data.dart';

import 'shared_news_bloc.dart';
import '../../../locator.dart';
import 'shared_news_argument.dart';

class SharedNews extends StatefulWidget {
  final SharedNewsArgument argument;

  const SharedNews(this.argument, {Key? key}) : super(key: key);

  @override
  _SharedNewsState createState() => _SharedNewsState();
}

class _SharedNewsState extends State<SharedNews> {
  late final SharedNewsBloc bloc;

  @override
  void initState() {
    bloc = get<SharedNewsBloc>(param1: context, param2: widget.argument.category);
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          newsList(),
        ],
      ),
    );
  }

  Widget newsList() {
    return ValueListenableBuilder<List<NewsTileModelData>>(
        valueListenable: bloc,
        builder: (context, modelDataList, child) {
          return ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: modelDataList.length,
              itemBuilder: (context, index) {
                return NewsTile(context, modelDataList[index]);
              }
          );
        }
    );
  }
}


