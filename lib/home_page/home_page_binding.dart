/*
 * *
 *  * Created by trisha dubey {https://www.linkedin.com/in/trisha-dubey-802b79157/} on 10/19/23, 7:24 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 9/13/23, 9:45 PM
 *
 */

import 'package:get/get.dart';

import 'home_page_logic.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageLogic());
  }
}
