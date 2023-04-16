import 'package:dartz/dartz.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/error/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser(String userEmail);
  Future<Either<Failure, UserEntity>> updateUser(String userEmail, {bool hasTasks});
  Future<Either<Failure, bool>> removeAccount(String userEmail);
}
