import 'dart:math';

import 'package:squad_premium_test/core/domain/entity/base_entity/base_entity.dart';

class TaskUseCaseParams extends BaseEntity {
  final String title;
  final String description;
  final bool isDone;
  int? idTask;

  TaskUseCaseParams({
    required this.title,
    required this.description,
    required this.isDone,
    this.idTask,
  }) : super(id: idTask ?? Random.secure().nextInt(100000));
}
