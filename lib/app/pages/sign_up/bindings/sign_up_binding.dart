import 'package:get/get.dart';

import '../sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    _registerControllers();
  }

  void _registerControllers() {
    Get.lazyPut<SignUpController>(SignUpController.new);
  }
}
