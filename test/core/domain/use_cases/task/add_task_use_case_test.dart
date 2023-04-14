import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/add_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';
import 'package:test/test.dart';

class TaskRepositorySpy extends Mock implements TaskRepository {}

class TaskUseCaseParamsSpy extends Fake implements TaskUseCaseParams {}

void main() {
  late AddTaskUseCase addTaskUseCase;
  late TaskRepository taskRepository;

  setUpAll(() {
    taskRepository = TaskRepositorySpy();
    addTaskUseCase = AddTaskUseCase(taskRepository);
  });

  tearDownAll(() {
    taskRepository = TaskRepositorySpy();
    addTaskUseCase = AddTaskUseCase(taskRepository);
  });

  test('should add task', () async {
    final params = TaskUseCaseParams(title: 'title', description: 'description', isDone: false);
    when(() => taskRepository.addTask(params)).thenAnswer((_) async => <TaskEntity>[]);

    final result = await addTaskUseCase(params);

    expect(result, isA<TaskEntity>());
    verify(() => taskRepository.addTask(params)).called(1);
  });

  test('should error on add task', () async {
    final params = TaskUseCaseParamsSpy();
    final exception = Exception('error');
    when(() => taskRepository.addTask(params)).thenThrow((_) async => exception);

    final result = await addTaskUseCase(params);

    expect(result, exception);
    verify(() => taskRepository.addTask(params)).called(1);
  });
}
