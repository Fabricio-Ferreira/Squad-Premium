import 'package:get/get.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/sign_in/sign_in_use_case.dart';

import '../login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    _injectUseCases();
    _registerControllers();
  }

  void _registerControllers() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find<SignInUseCase>()));
  }

  void _injectUseCases() {
    Get.lazyPut<SignInUseCase>(() => SignInUseCase(Get.find()));
  }
}
