import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage.dart';
import 'package:squad_premium_test/core/data/repositories/task/task_repository_impl.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';

class MockAppLocalStorage extends Mock implements AppLocalStorage {}

class TaskUseCaseParamsSpy extends Fake implements TaskUseCaseParams {}

void main() {
  late MockAppLocalStorage mockAppLocalStorage;
  late TaskRepositoryImpl taskRepositoryImpl;

  setUpAll(() {
    mockAppLocalStorage = MockAppLocalStorage();
    taskRepositoryImpl = TaskRepositoryImpl(mockAppLocalStorage);
  });

  tearDownAll(() {
    reset(mockAppLocalStorage);
  });

  group('TaskRepositoryImpl', () {
    test('should be a subclass of TaskRepositoryImpl', () {
      expect(taskRepositoryImpl, isA<TaskRepositoryImpl>());
    });

    test('should call getTasks', () async {
      when(() => mockAppLocalStorage.get(any())).thenAnswer((_) async => jsonEncode([]));
      await taskRepositoryImpl.getTasks();
      verify(() => mockAppLocalStorage.get(any())).called(1);
    });

    test('should call addTask', () async {
      final params = TaskUseCaseParamsSpy();
      when(() => mockAppLocalStorage.save(any(), any())).thenAnswer((_) async => true);
      await taskRepositoryImpl.addTask(params);
      verify(() => mockAppLocalStorage.save(any(), any())).called(1);
    });
  });
}
