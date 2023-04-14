import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/get_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';
import 'package:test/test.dart';

class TaskRepositorySpy extends Mock implements TaskRepository {}

class TaskUseCaseParamsSpy extends Fake implements TaskUseCaseParams {}

void main() {
  late GetTaskUseCase getTaskUseCase;
  late TaskRepository taskRepository;

  setUpAll(() {
    taskRepository = TaskRepositorySpy();
    getTaskUseCase = GetTaskUseCase(taskRepository);
  });

  tearDownAll(() {
    taskRepository = TaskRepositorySpy();
    getTaskUseCase = GetTaskUseCase(taskRepository);
  });

  test('should get all task', () async {
    when(() => taskRepository.getTasks()).thenAnswer((_) async => <TaskEntity>[]);

    final result = await getTaskUseCase(NoParams());

    expect(result, isA<TaskEntity>());
    verify(() => taskRepository.getTasks()).called(1);
  });

  test('should error for get all task', () async {
    final exception = Exception('error');
    when(() => taskRepository.getTasks()).thenThrow((_) async => exception);

    final result = await getTaskUseCase(NoParams());

    expect(result, false);
    verify(() => taskRepository.getTasks()).called(1);
  });
}
