import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
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

  group('AddTaskUseCase', () {
    test('should be a subclass of AddTaskUseCase', () {
      expect(addTaskUseCase, isA<AddTaskUseCase>());
    });

    test('should add task', () async {
      final params = TaskUseCaseParams(
        title: 'title',
        description: 'description',
        isDone: false,
        userId: Faker().randomGenerator.integer(100),
      );
      when(() => taskRepository.addTask(params))
          .thenAnswer((_) async => const Right(<TaskEntity>[]));

      final result = await addTaskUseCase(params);

      verify(() => taskRepository.addTask(params)).called(1);
      result.fold(
          (err) => fail('Task deleted failed: $err'), (a) => expect(a, isA<List<TaskEntity>>()));
      expect(result, isA<Right>());
    });

    test('should error on add task', () async {
      final params = TaskUseCaseParamsSpy();

      try {
        when(() => taskRepository.addTask(params)).thenAnswer((_) async => throw Exception());
        await addTaskUseCase(params);
        verify(() => taskRepository.addTask(params)).called(1);
      } on Exception catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
}
