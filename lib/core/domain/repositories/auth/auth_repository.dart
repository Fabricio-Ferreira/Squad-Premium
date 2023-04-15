import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/params/user_use_case_params.dart';
import 'package:squad_premium_test/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn(UserUseCaseParams params);
  Future<Either<Failure, UserEntity>> signUp(UserUseCaseParams params);
}
