import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';

import '../../entity/task/task_entity.dart';
import '../base/base_use_case.dart';
import 'params/task_use_case_params.dart';

class UpdateTaskUseCase extends UseCase<TaskUseCaseParams, List<TaskEntity>> {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  @override
  Future<List<TaskEntity>> call(TaskUseCaseParams params) => repository.updateTask(params);
}
