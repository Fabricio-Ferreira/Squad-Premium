import 'package:get/get.dart';
import 'package:squad_premium_test/core/data/repositories/auth/auth_repository_impl.dart';
import 'package:squad_premium_test/core/data/repositories/task/task_repository_impl.dart';
import 'package:squad_premium_test/core/data/repositories/user/user_repository_impl.dart';
import 'package:squad_premium_test/core/domain/repositories/auth/auth_repository.dart';
import 'package:squad_premium_test/core/domain/repositories/user/user_repository.dart';

import '../../domain/repositories/task/task_repository.dart';

class RepositoriesModule {
  RepositoriesModule._();

  static void init() {
    _injectAuthRepository();
    _injectTaskRepository();
    _injectUserRepository();
  }

  static void _injectAuthRepository() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()), fenix: true);
  }

  static void _injectTaskRepository() {
    Get.put<TaskRepository>(TaskRepositoryImpl(Get.find()));
  }

  static void _injectUserRepository() {
    Get.put<UserRepository>(UserRepositoryImpl(Get.find()));
  }
}
