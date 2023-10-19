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
                return ListTile(
                  title: Text(news.title.toString()),
                  subtitle: Text(news.description.toString()),
                  onTap: () {
                    // Handle article click
                  },
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
