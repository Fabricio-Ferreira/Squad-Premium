import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/mixin/alert_mixin.dart';
import 'package:squad_premium_test/app/pages/home/arguments/home_arguments.dart';
import 'package:squad_premium_test/app/pages/login/login_page.dart';
import 'package:squad_premium_test/app/utils/try_cast.dart';
import 'package:squad_premium_test/app/widgets/custom_dialog_task.dart';
import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/add_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/get_task_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/params/task_use_case_params.dart';
import 'package:squad_premium_test/core/domain/use_cases/task/update_task_use_case.dart';
import 'package:squad_premium_test/core/error/failure.dart';

class HomeController extends GetxController with AlertMixin {
  final AddTaskUseCase _addTaskUseCase;
  final GetTaskUseCase _getTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  HomeController(
    this._addTaskUseCase,
    this._getTaskUseCase,
    this._updateTaskUseCase,
  );

  late HomeArguments _arguments;
  final _nameUser = ''.obs;
  final check = false.obs;
  HomeArguments get arguments => _arguments;
  String get nameUser => _nameUser.value;
  final tasksList = <TaskEntity>[].obs;
  final tasksListPending = <TaskEntity>[].obs;
  final tasksListDone = <TaskEntity>[].obs;

  final _titleTaskController = TextEditingController();
  final _descriptionTaskController = TextEditingController();
  TextEditingController get titleTaskController => _titleTaskController;
  TextEditingController get descriptionTaskController => _descriptionTaskController;

  void _getArguments() {
    final arguments = tryCast<HomeArguments>(Get.arguments);
    if (arguments != null) {
      _arguments = arguments;
      _nameUser.value = _arguments.nameUser;
    }
  }

  void onFocusGained() {
    _getArguments();
    _getTasks();
  }

  void logout() => LoginPage.navigateTo;

  void navigateToCreateTask() => Get.dialog(const CustomDialogTask());

  Future<void> addTask() async {
    final params = TaskUseCaseParams(
      title: _titleTaskController.text,
      description: _descriptionTaskController.text,
      isDone: check.value,
    );
    final result = await _addTaskUseCase(params);
    result.fold(
      _handleError,
      (task) => _getTasks(),
    );
  }

  Future<void> _getTasks() async {
    final result = await _getTaskUseCase(NoParams());

    result.fold(
      _handleError,
      _assignTasks,
    );
  }

  Future<void> updateTask(TaskEntity task) async {
    debugPrint(task.toString());

    final params = TaskUseCaseParams(
      idTask: task.id,
      title: task.title,
      description: task.description,
      isDone: !task.isDone,
    );

    final result = await _updateTaskUseCase(params);
    result.fold(
      _handleError,
      (task) => _getTasks(),
    );
  }

  void _handleError(Failure failure) => showSnackBar(message: failure.message, isError: true);

  void _assignTasks(List<TaskEntity> tasks) {
    tasksList.assignAll(tasks);
    tasksListPending.assignAll(tasksList.where((element) => !element.isDone));
    tasksListDone.assignAll(tasksList.where((element) => element.isDone));
    showSnackBar(message: 'Suas tarefas foram atualizadas com sucesso!');
  }
}
