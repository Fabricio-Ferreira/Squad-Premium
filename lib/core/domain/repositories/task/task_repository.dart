import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<List<TaskEntity>> addTask(TaskUseCaseParams params);
  Future<List<TaskEntity>> updateTask(TaskUseCaseParams params);
  Future<List<TaskEntity>> deleteTask(int idTask);
}
