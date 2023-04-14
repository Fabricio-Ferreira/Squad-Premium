import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';

import 'params/task_use_case_params.dart';

class AddTaskUseCase extends UseCase<TaskUseCaseParams, List<TaskEntity>> {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  @override
  Future<List<TaskEntity>> call(TaskUseCaseParams params) => repository.addTask(params);
}
