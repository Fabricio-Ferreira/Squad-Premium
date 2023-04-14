import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';

class GetTaskUseCase extends UseCase<NoParams, List<TaskEntity>> {
  final TaskRepository repository;

  GetTaskUseCase(this.repository);

  @override
  Future<List<TaskEntity>> call(NoParams params) => repository.getTasks();
}
