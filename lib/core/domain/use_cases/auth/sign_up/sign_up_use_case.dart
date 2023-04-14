import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';

import '../params/user_use_case_params.dart';

class SignUpUseCase extends UseCase<UserUseCaseParams, UserEntity> {
  @override
  Future<UserEntity> call(UserUseCaseParams params) {
    throw UnimplementedError();
  }
}
