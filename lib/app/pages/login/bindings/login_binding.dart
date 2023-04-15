import 'package:get/get.dart';

import '../login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    _registerControllers();
  }

  void _registerControllers() {
    Get.lazyPut<LoginController>(LoginController.new);
  }
}
