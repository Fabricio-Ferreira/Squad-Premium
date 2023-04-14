import 'dart:convert';

import 'package:squad_premium_test/core/constants/local_storage_key.dart';
import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage.dart';
import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/task/task_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';

class TaskRepositoryImpl implements TaskRepository {
  final AppLocalStorage _localStorage;

  TaskRepositoryImpl(this._localStorage);

  @override
  Future<List<TaskEntity>> addTask(TaskUseCaseParams params) => getTasks().then(
        (tasksList) async {
          tasksList.add(
            TaskEntity(
              id: params.id,
              title: params.title,
              description: params.description,
              isDone: params.isDone,
            ),
          );
          if (await _localStorage.save(LocalStorageKeyEnum.tasks.key, jsonEncode(tasksList))) {
            return tasksList;
          } else {
            throw Exception('Erro ao salvar tarefa');
          }
        },
      );

  @override
  Future<List<TaskEntity>> deleteTask(int idTask) async {
    final tasksList = await getTasks();
    tasksList.removeWhere((task) => task.id == idTask);
    if (await _localStorage.save(LocalStorageKeyEnum.tasks.key, jsonEncode(tasksList))) {
      return tasksList;
    } else {
      throw Exception('Erro ao deletar tarefa');
    }
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final tasksJson = await _localStorage.get(LocalStorageKeyEnum.tasks.key);

    final tasksList = jsonDecode(tasksJson) as List<TaskEntity>;
    return tasksList
        .map(
          (e) => TaskEntity(
            id: e.id,
            title: e.title,
            description: e.description,
            isDone: e.isDone,
          ),
        )
        .toList();
  }

  @override
  Future<List<TaskEntity>> updateTask(TaskUseCaseParams params) async {
    final tasksList = await getTasks();
    final index = tasksList.indexWhere((task) => task.id == params.id);
    if (index != -1) {
      tasksList[index] = TaskEntity(
        id: params.id,
        title: params.title,
        description: params.description,
        isDone: params.isDone,
      );
      if (await _localStorage.save(LocalStorageKeyEnum.tasks.key, jsonEncode(tasksList))) {
        return tasksList;
      } else {
        throw Exception('Erro ao atualizar tarefa');
      }
    } else {
      throw Exception('Tarefa não encontrada');
    }
  }
}
