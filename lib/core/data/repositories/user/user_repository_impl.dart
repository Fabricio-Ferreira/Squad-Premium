import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage.dart';
import 'package:squad_premium_test/core/data/helpers/app_error.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/user/user_repository.dart';
import 'package:squad_premium_test/core/error/failure.dart';

class UserRepositoryImpl implements UserRepository {
  final AppLocalStorage _localStorage;

  UserRepositoryImpl(this._localStorage);

  @override
  Future<Either<Failure, UserEntity>> getUser(String userEmail) async {
    final user = await _localStorage.getData(userEmail);
    if (user.contains(AppError.keyNotFound) || user.isEmpty) {
      return const Left(BadRequestFailure(message: 'Usuário não encontrado'));
    } else {
      final userEntity = UserEntity.fromJson(user);
      return Right(userEntity);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(String userEmail, {bool hasTasks = false}) async {
    final user = await _localStorage.getData(userEmail);
    if (user.contains(AppError.keyNotFound) || user.isEmpty) {
      return const Left(BadRequestFailure(message: 'Usuário não encontrado'));
    } else {
      final userEntity = UserEntity.fromJson(user);
      final updatedUserEntity = userEntity.copyWith(hasTasks: hasTasks);
      await _localStorage.saveData(userEmail, updatedUserEntity.toJson());
      return Right(updatedUserEntity);
    }
  }

  @override
  Future<Either<Failure, bool>> removeAccount(String userEmail) async {
    final user = await _localStorage.getData(userEmail);
    if (user.contains(AppError.keyNotFound) || user.isEmpty) {
      return const Left(BadRequestFailure(message: 'Usuário não encontrado'));
    }

    final result = await _localStorage.remove(userEmail);
    if (result) {
      return const Right(true);
    } else {
      return const Left(ServerFailure(message: 'Erro ao remover usuário'));
    }
  }
}
