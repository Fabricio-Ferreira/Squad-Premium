import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/constants/local_storage_key.dart';
import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage.dart';
import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';
import 'package:squad_premium_test/core/error/failure.dart';

class TaskRepositoryImpl implements TaskRepository {
  final AppLocalStorage _localStorage;

  TaskRepositoryImpl(this._localStorage);

  @override
  Future<Either<Failure, List<TaskEntity>>> addTask(TaskUseCaseParams params) async {
    try {
      final result = await getTasks();

      result.fold(
        (failure) => const Left(
          ServerFailure(message: 'Erro ao salvar tarefa'),
        ),
        (list) async {
          list.add(
            TaskEntity(
              id: params.id,
              title: params.title,
              description: params.description,
              isDone: params.isDone,
            ),
          );
          if (await _localStorage.saveData(LocalStorageKeyEnum.tasks.key, jsonEncode(list))) {
            return Right(list);
          }
        },
      );
      return result;
    } on Exception catch (err) {
      return Left(ServerFailure(message: 'Erro ao salvar tarefa, $err'));
    }
  }

  @override
  Future<List<TaskEntity>> deleteTask(int idTask) async {
    // final tasksList = await getTasks();
    // tasksList.removeWhere((task) => task.id == idTask);
    // if (await _localStorage.saveData(LocalStorageKeyEnum.tasks.key, jsonEncode(tasksList))) {
    //   return tasksList;
    // }

    throw Exception('Erro ao deletar tarefa');
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    try {
      final tasksJson = await _localStorage.getData(LocalStorageKeyEnum.tasks.key);
      final tasks = <TaskEntity>[];
      if (tasksJson.isEmpty) {
        return const Right([]);
      }

      final tasksList = jsonDecode(tasksJson) as Iterable;

      tasksList.forEach((task) {
        tasks.add(TaskEntity.fromJson(task));
      });

      return Right(tasks);
    } on Exception catch (err) {
      return Left(ServerFailure(message: 'Erro ao buscar tarefas : $err'));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> updateTask(TaskUseCaseParams params) async {
    try {
      final tasksList = await getTasks();

      tasksList.fold(
        (failure) => const Left(
          ServerFailure(message: 'Tarefa não encontrada'),
        ),
        (list) async {
          final index = list.indexWhere((task) => task.id == params.id);
          if (index != -1) {
            list[index] = TaskEntity(
              id: params.id,
              title: params.title,
              description: params.description,
              isDone: params.isDone,
            );
            if (await _localStorage.saveData(LocalStorageKeyEnum.tasks.key, jsonEncode(list))) {
              return Right(list);
            }
          }
        },
      );
      return tasksList;
    } on Exception catch (e) {
      return Left(ServerFailure(message: 'Erro ao atualizar tarefa, $e'));
    }
  }
}
