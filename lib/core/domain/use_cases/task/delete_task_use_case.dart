import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';

class DeleteTaskUseCase extends UseCase<int, List<TaskEntity>> {
  final TaskRepository repository;

  DeleteTaskUseCase(this.repository);

  @override
  Future<List<TaskEntity>> call(int params) => repository.deleteTask(params);
}
