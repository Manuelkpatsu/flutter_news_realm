// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';

import 'package:flutternewsrealm/models/news_response_model.dart';
import 'package:flutternewsrealm/utils/constants.dart';
import 'package:http/http.dart';

class NewsApiRepository {
  NewsApiRepository();

  Client client = Client();
  final _apiKey = Constant.apiKey;

  Future<List<Article>?> fetchNews({String category = ''}) async {
    try {
      var url =
          "${Constant.baseUrl}${Constant.topHeadLine}?country=us&apiKey=$_apiKey&category=$category";

      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return NewsResponseModel.fromRawJson(response.body).articles;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      throw e;
    }
  }
}
