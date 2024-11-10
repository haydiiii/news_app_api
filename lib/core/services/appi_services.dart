import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app_api/core/constants/constant.dart';

import '../../features/model/news_model.dart';


class ApiServices {
  // parse url from string to Uri
  // use get method to get response using http
  // check if status code is 200
  // decode (res.body) from string to json
  // parse to model and return it
  static Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      // https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=48b16be6252e45a1a3a491c5c6496d72
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadlines}?country=us&category=$category&${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<NewsModel?> getNewsBySearch(String query) async {
    try {
      // https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=48b16be6252e45a1a3a491c5c6496d72
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadlines}?q=$query&${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<NewsModel?> getNewsBySource(String source) async {
    try {
      // https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=48b16be6252e45a1a3a491c5c6496d72
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadlines}?sources=$source&${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}