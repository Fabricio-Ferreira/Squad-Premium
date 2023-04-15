import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/auth/auth_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';
import 'package:squad_premium_test/core/error/failure.dart';

import '../params/user_use_case_params.dart';

class SignInUseCase extends FutureUseCase<UserUseCaseParams, UserEntity> {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserUseCaseParams params) => _repository.signIn(params);
}
