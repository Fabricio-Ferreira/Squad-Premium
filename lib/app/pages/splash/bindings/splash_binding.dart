import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    registerController();
  }

  void registerController() {
    Get.put<SplashController>(
      SplashController(),
      permanent: true,
    );
  }
}
