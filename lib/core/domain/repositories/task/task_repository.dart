import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';
import 'package:squad_premium_test/core/error/failure.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> getTasks();
  Future<Either<Failure, List<TaskEntity>>> addTask(TaskUseCaseParams params);
  Future<Either<Failure, List<TaskEntity>>> updateTask(TaskUseCaseParams params);
  Future<Either<Failure, List<TaskEntity>>> deleteTask(int idTask);
}
