import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/domain/repositories/user/user_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/user/params/user_params.dart';
import 'package:squad_premium_test/core/error/failure.dart';

import '../../entity/user/user_entity.dart';

class UpdateUserUseCase extends FutureUseCase<UserParams, UserEntity> {
  final UserRepository _repository;

  UpdateUserUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserParams params) => _repository.updateUser(
        params.userEmail,
        hasTasks: params.hasTasks,
      );
}
