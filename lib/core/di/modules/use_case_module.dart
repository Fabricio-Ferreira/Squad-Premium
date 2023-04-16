import 'package:get/get.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/sign_in/sign_in_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/sign_up/sign_up_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/add_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/delete_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/get_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/update_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/user/get_information_user_use_case.dart';

class UseCaseModule {
  UseCaseModule._();

  static void init() {
    _injectAuthUseCases();
    _injectTaskUseCases();
    _injectUserUseCases();
  }

  static void _injectAuthUseCases() {
    Get.create<SignInUseCase>(() => SignInUseCase(Get.find()));
    Get.create<SignUpUseCase>(() => SignUpUseCase(Get.find()));
  }

  static void _injectTaskUseCases() {
    Get.create<GetTaskUseCase>(() => GetTaskUseCase(Get.find()));
    Get.create<AddTaskUseCase>(() => AddTaskUseCase(Get.find()));
    Get.create<UpdateTaskUseCase>(() => UpdateTaskUseCase(Get.find()));
    Get.create<DeleteTaskUseCase>(() => DeleteTaskUseCase(Get.find()));
  }

  static void _injectUserUseCases() {
    Get.create<GetUserUseCase>(() => GetUserUseCase(Get.find()));
  }
}
