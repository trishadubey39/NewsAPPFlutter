import 'dart:convert';
import 'dart:developer';

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
        Uri.http(NetworkApis.BASE_URL,NetworkApis.NEWS_API,queryParameters),
        headers: {
          'access_key': NetworkApis.API_KEY,
          'languages': 'fr,-en',
          'countries': 'ca,in',
          'limit': '30',
          'offset': '30',
        },
      );

      print(response.statusCode);
      log(response.body);
      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        final news = NewsListModel.fromJson(res).data;
        newsList.assignAll(news);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
