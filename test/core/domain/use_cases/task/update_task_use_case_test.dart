import 'package:dartz/dartz.dart';
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

  group('UpdateTaskUseCase', () {
    final params = TaskUseCaseParams(
      title: 'title',
      description: 'description',
      isDone: false,
      userId: 1,
    );
    test('should be a subclass of UpdateTaskUseCase', () {
      expect(updateTaskUseCase, isA<UpdateTaskUseCase>());
    });

    test('should return a list of TaskEntity', () async {
      when(() => taskRepository.updateTask(params))
          .thenAnswer((_) async => const Right(<TaskEntity>[]));

      final result = await updateTaskUseCase(params);

      verify(() => taskRepository.updateTask(params)).called(1);
      result.fold(
          (err) => fail('Task deleted failed: $err'), (a) => expect(a, isA<List<TaskEntity>>()));
      expect(result, isA<Right>());
    });

    test('should error on update task', () async {
      try {
        when(() => taskRepository.updateTask(params)).thenAnswer((_) async => throw Exception());
        await updateTaskUseCase(params);
        verify(() => taskRepository.updateTask(params)).called(1);
      } on Exception catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
}
