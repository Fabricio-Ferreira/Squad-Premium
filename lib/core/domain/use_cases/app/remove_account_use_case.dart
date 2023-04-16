import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/domain/repositories/user/user_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';
import 'package:squad_premium_test/core/error/failure.dart';

class RemoveAccountUseCase extends FutureUseCase<String, bool> {
  final UserRepository _repository;

  RemoveAccountUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(String params) => _repository.removeAccount(params);
}
