import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/update_task_use_case.dart';
import 'package:test/test.dart';

class TaskRepositorySpy extends Mock implements TaskRepository {}

class TaskUseCaseParamsSpy extends Fake implements TaskUseCaseParams {}

void main() {
  late UpdateTaskUseCase updateTaskUseCase;
  late TaskRepository taskRepository;

  setUpAll(() {
    taskRepository = TaskRepositorySpy();
    updateTaskUseCase = UpdateTaskUseCase(taskRepository);
  });

  tearDownAll(() {
    taskRepository = TaskRepositorySpy();
    updateTaskUseCase = UpdateTaskUseCase(taskRepository);
  });

  test('should update task', () async {
    final params = TaskUseCaseParams(title: 'title', description: 'description', isDone: false);
    when(() => taskRepository.updateTask(params)).thenAnswer((_) async => <TaskEntity>[]);

    final result = await updateTaskUseCase(params);

    expect(result, isA<TaskEntity>());
    verify(() => taskRepository.updateTask(params)).called(1);
  });

  test('should error on update task', () async {
    final params = TaskUseCaseParamsSpy();
    final exception = Exception('error');
    when(() => taskRepository.updateTask(params)).thenThrow((_) async => exception);

    final result = await updateTaskUseCase(params);

    expect(result, false);
    verify(() => taskRepository.updateTask(params)).called(1);
  });
}
