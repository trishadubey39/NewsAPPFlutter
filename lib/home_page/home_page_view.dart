import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_logic.dart';

class HomePagePage extends StatefulWidget {
  const HomePagePage({Key? key}) : super(key: key);

  @override
  State<HomePagePage> createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  final logic = Get.find<HomePageLogic>();
  final state = Get.find<HomePageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    Get.delete<HomePageLogic>();
    super.dispose();
  }
}