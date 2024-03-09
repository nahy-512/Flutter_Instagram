import 'package:get/get.dart';

import '../controller/bottom_nav_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationController());
  }
}