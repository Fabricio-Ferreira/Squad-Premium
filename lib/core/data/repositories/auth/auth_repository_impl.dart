import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage.dart';
import 'package:squad_premium_test/core/data/helpers/app_error.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/auth/auth_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/params/user_use_case_params.dart';
import 'package:squad_premium_test/core/error/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppLocalStorage _localStorage;

  AuthRepositoryImpl(this._localStorage);

  @override
  Future<Either<Failure, UserEntity>> signIn(UserUseCaseParams params) async {
    final user = await _localStorage.getData(params.email);
    if (user.contains(AppError.keyNotFound) || user.isEmpty) {
      return const Left(BadRequestFailure(message: 'Usuário não encontrado'));
    } else {
      final userEntity = UserEntity.fromJson(user);
      if (userEntity.password == params.password) {
        return Right(userEntity);
      } else {
        return const Left(BadRequestFailure(message: 'Senha incorreta'));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(UserUseCaseParams params) async {
    final user = await _localStorage.getData(params.email);
    if (user.contains(AppError.keyNotFound) || user.isEmpty) {
      final newUser = UserEntity(
        email: params.email,
        password: params.password,
        name: params.name ?? '',
        id: params.id,
      );
      if (await _localStorage.saveData(params.email, newUser.toJson())) {
        return Right(newUser);
      } else {
        return const Left(ServerFailure(message: 'Erro ao salvar usuário'));
      }
    } else {
      return const Left(ServerFailure(message: 'Usuário já cadastrado'));
    }
  }
}
