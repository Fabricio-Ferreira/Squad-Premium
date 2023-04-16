import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/user/user_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';
import 'package:squad_premium_test/core/error/failure.dart';

class GetUserUseCase extends FutureUseCase<String, UserEntity> {
  final UserRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(String params) => _repository.getUser(params);
}
