import 'dart:math';

import 'package:squad_premium_test/core/domain/entity/base_entity/base_entity.dart';

class UserUseCaseParams extends BaseEntity {
  final String? name;
  final String email;
  final String password;
  final bool? hasTasks;

  UserUseCaseParams({
    required this.email,
    required this.password,
    this.hasTasks,
    this.name,
  }) : super(id: Random.secure().nextInt(100000));
}
