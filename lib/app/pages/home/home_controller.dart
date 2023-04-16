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
import 'package:squad_premium_test/core/domain/use_cases/user/get_information_user_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/user/params/user_params.dart';
import 'package:squad_premium_test/core/domain/use_cases/user/update_user_use_case.dart';
import 'package:squad_premium_test/core/error/failure.dart';

class HomeController extends GetxController with AlertMixin {
  final AddTaskUseCase _addTaskUseCase;
  final GetTaskUseCase _getTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final GetUserUseCase _getUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;

  HomeController(
    this._addTaskUseCase,
    this._getTaskUseCase,
    this._updateTaskUseCase,
    this._getUserUseCase,
    this._updateUserUseCase,
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
    }
  }

  void onFocusGained() {
    _getArguments();
    _getUser();
  }

  void logout() => LoginPage.navigateTo;

  void navigateToCreateTask() => Get.dialog(const CustomDialogTask());

  Future<void> addTask() async {
    final params = TaskUseCaseParams(
      title: _titleTaskController.text,
      description: _descriptionTaskController.text,
      isDone: check.value,
      userId: _arguments.userId,
    );
    final result = await _addTaskUseCase(params);
    result.fold(
      _handleError,
      (task) {
        _updateUser();
      },
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
      userId: _arguments.userId,
    );

    final result = await _updateTaskUseCase(params);
    result.fold(
      _handleError,
      (task) => _getTasks(),
    );
  }

  void _handleError(Failure failure) => showSnackBar(message: failure.message, isError: true);

  void _assignTasks(List<TaskEntity> tasks) {
    tasksList.assignAll(tasks.where((element) => element.userId == _arguments.userId));
    tasksListPending.assignAll(
      tasksList.where((element) => !element.isDone && element.userId == _arguments.userId),
    );
    tasksListDone.assignAll(
      tasksList.where((element) => element.isDone && element.userId == _arguments.userId),
    );

    if (tasks.isNotEmpty) {
      _clearFields();
      showSnackBar(message: 'Suas tarefas foram atualizadas com sucesso!');
    }
  }

  Future<void> _getUser() async {
    final result = await _getUserUseCase(_arguments.userEmail);
    result.fold(
      _handleError,
      (user) async {
        _nameUser.value = user.name;
        if (user.hasTasks) {
          await _getTasks();
        } else {
          showSnackBar(message: 'Você não possui tarefas cadastradas!');
        }
      },
    );
  }

  void _clearFields() {
    _titleTaskController.clear();
    _descriptionTaskController.clear();
    check.value = false;
  }

  Future<void> _updateUser() async {
    final params = UserParams(userEmail: _arguments.userEmail, hasTasks: true);

    final result = await _updateUserUseCase(params);
    result.fold(
      _handleError,
      (user) => _getTasks(),
    );
  }
}
