import 'dart:math';

import 'package:squad_premium_test/core/domain/entity/base_entity/base_entity.dart';

class TaskUseCaseParams extends BaseEntity {
  final String title;
  final String description;
  final bool isDone;

  TaskUseCaseParams({
    required this.title,
    required this.description,
    required this.isDone,
  }) : super(id: Random.secure().nextInt(100000));
}
