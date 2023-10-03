import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../network/NetworkController.dart';
import 'home_page_logic.dart';

class HomePagePage extends StatelessWidget {
  final NewsController newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Obx(
            () =>
            ListView.builder(
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
            ),
      ),
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
}