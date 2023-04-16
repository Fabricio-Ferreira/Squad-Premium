import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/home/home_controller.dart';
import 'package:squad_premium_test/core/domain/use_cases/app/remove_account_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/add_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/delete_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/get_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/update_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/user/get_information_user_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/user/update_user_use_case.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    _injectUseCases();
    _registerControllers();
  }

  void _registerControllers() {
    Get.lazyPut<HomeController>(() => HomeController(
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }

  void _injectUseCases() {
    Get.lazyPut<AddTaskUseCase>(() => AddTaskUseCase(Get.find()));
    Get.lazyPut<GetTaskUseCase>(() => GetTaskUseCase(Get.find()));
    Get.lazyPut<UpdateTaskUseCase>(() => UpdateTaskUseCase(Get.find()));
    Get.lazyPut<GetUserUseCase>(() => GetUserUseCase(Get.find()));
    Get.lazyPut<UpdateUserUseCase>(() => UpdateUserUseCase(Get.find()));
    Get.lazyPut<RemoveAccountUseCase>(() => RemoveAccountUseCase(Get.find()));
    Get.lazyPut<DeleteTaskUseCase>(() => DeleteTaskUseCase(Get.find()));
  }
}
