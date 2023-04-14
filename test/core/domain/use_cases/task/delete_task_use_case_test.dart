import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/delete_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';

class TaskRepositorySpy extends Mock implements TaskRepository {}

class TaskUseCaseParamsSpy extends Fake implements TaskUseCaseParams {}

void main() {
  late DeleteTaskUseCase deleteTaskUseCase;
  late TaskRepository taskRepository;

  setUpAll(() {
    taskRepository = TaskRepositorySpy();
    deleteTaskUseCase = DeleteTaskUseCase(taskRepository);
  });

  tearDownAll(() {
    taskRepository = TaskRepositorySpy();
    deleteTaskUseCase = DeleteTaskUseCase(taskRepository);
  });

  test('should delete task', () async {
    final params = TaskUseCaseParams(title: 'title', description: 'description', isDone: false);
    when(() => taskRepository.deleteTask(params.id)).thenAnswer((_) async => <TaskEntity>[]);

    final result = await deleteTaskUseCase(params.id);

    expect(result, isA<TaskEntity>());
    verify(() => taskRepository.deleteTask(params.id)).called(1);
  });

  test('should error delete task', () async {
    final exception = Exception('error');
    final params = TaskUseCaseParams(title: 'title', description: 'description', isDone: false);
    when(() => taskRepository.deleteTask(params.id)).thenThrow((_) async => exception);

    final result = await deleteTaskUseCase(params.id);

    expect(result, true);
    verify(() => taskRepository.deleteTask(params.id)).called(1);
  });
}
