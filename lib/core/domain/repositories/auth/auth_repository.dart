import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/params/user_use_case_params.dart';

abstract class AuthRepository {
  Future<UserEntity> signIn(UserUseCaseParams params);
  Future<UserEntity> signUp(UserUseCaseParams params);
}
