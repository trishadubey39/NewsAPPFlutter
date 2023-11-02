/*
 * *
 *  * Created by trisha dubey {https://www.linkedin.com/in/trisha-dubey-802b79157/} on 10/19/23, 7:24 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/19/23, 5:33 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../network/NetworkController.dart';

class HomePagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: GetX<NewsController>(
          init: NewsController(),
          builder: (newsController) {
            print(newsController.newsList.length.toString());
            // print(newsController.newsList[0].title);
            return ListView.builder(
              itemCount: newsController.newsList.length,
              itemBuilder: (context, index) {
                final news = newsController.newsList[index];
                return Column(
                  children: [
                    Text(news.title.toString()),
                    Text(news.description.toString()),
                  ],
                );
              },
            );
          }),
    );
  }
}
//   const HomePagePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePagePage> createState() => _HomePagePageState();
// }
//
// class _HomePagePageState extends State<HomePagePage> {
//   final logic = Get.find<HomePageLogic>();
//   final state = Get.find<HomePageLogic>().state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   @override
//   void dispose() {
//     Get.delete<HomePageLogic>();
//     super.dispose();
//   }
// }
