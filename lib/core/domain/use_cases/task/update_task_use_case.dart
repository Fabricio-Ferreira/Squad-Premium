import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/error/failure.dart';

import '../../entity/task/task_entity.dart';
import '../base/base_use_case.dart';
import 'params/task_use_case_params.dart';

class UpdateTaskUseCase extends FutureUseCase<TaskUseCaseParams, List<TaskEntity>> {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(TaskUseCaseParams params) =>
      repository.updateTask(params);
}
