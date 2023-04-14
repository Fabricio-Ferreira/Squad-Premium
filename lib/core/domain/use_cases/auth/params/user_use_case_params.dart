import 'dart:math';

import 'package:squad_premium_test/core/domain/entity/base_entity/base_entity.dart';

class UserUseCaseParams extends BaseEntity {
  final String name;
  final String email;
  final String password;

  UserUseCaseParams({
    required this.name,
    required this.email,
    required this.password,
  }) : super(id: Random.secure().nextInt(100000));
}
