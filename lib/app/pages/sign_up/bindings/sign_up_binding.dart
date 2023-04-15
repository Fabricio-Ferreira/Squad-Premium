import 'package:get/get.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/sign_up/sign_up_use_case.dart';

import '../sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    _injectUseCases();
    _registerControllers();
  }

  void _registerControllers() {
    Get.lazyPut<SignUpController>(() => SignUpController(Get.find<SignUpUseCase>()));
  }

  void _injectUseCases() {
    Get.lazyPut<SignUpUseCase>(() => SignUpUseCase(Get.find()));
  }
}
