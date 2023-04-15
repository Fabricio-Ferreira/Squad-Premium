import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    _registerControllers();
  }

  void _registerControllers() {
    Get.lazyPut<HomeController>(HomeController.new);
  }
}
