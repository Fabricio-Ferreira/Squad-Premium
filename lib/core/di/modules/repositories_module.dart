import 'package:get/get.dart';
import 'package:squad_premium_test/core/data/repositories/auth/auth_repository_impl.dart';
import 'package:squad_premium_test/core/data/repositories/task/task_repository_impl.dart';
import 'package:squad_premium_test/core/domain/repositories/auth/auth_repository.dart';

import '../../domain/repositories/task/task_repository.dart';

class RepositoriesModule {
  RepositoriesModule._();

  static void init() {
    _injectAuthRepository();
    _injectTaskRepository();
  }

  static void _injectAuthRepository() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()), fenix: true);
  }

  static void _injectTaskRepository() {
    Get.lazyPut<TaskRepository>(() => TaskRepositoryImpl(Get.find()));
  }
}
