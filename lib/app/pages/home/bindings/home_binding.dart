import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/home/home_controller.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/add_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/get_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/update_task_use_case.dart';

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
        ));
  }

  void _injectUseCases() {
    Get.lazyPut<AddTaskUseCase>(() => AddTaskUseCase(Get.find()));
    Get.lazyPut<GetTaskUseCase>(() => GetTaskUseCase(Get.find()));
    Get.lazyPut<UpdateTaskUseCase>(() => UpdateTaskUseCase(Get.find()));
  }
}
