import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_flutter/home_page/NewsListModel.dart';
import 'package:news_app_flutter/network/NetworkApis.dart';

class NewsController extends GetxController {
  RxList<News> newsList = <News>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final queryParameters = {
        'access_key':NetworkApis.API_KEY,
      };
      final response = await http.get(
        Uri.https(NetworkApis.BASE_URL,NetworkApis.NEWS_API,queryParameters),
        headers: {
          'access_key': NetworkApis.API_KEY,
          'languages': 'fr,-en',
          'countries': 'ca,in',
          'limit': '30',
          'offset': '30',
        },
      );

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        final news =
            res.map((data) => new NewsListModel.fromJson(data)).toList();
        newsList.assignAll(news);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
