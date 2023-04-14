import 'dart:convert';

import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage.dart';
import 'package:squad_premium_test/core/data/helpers/app_error.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/auth/auth_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/params/user_use_case_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppLocalStorage _localStorage;

  AuthRepositoryImpl(this._localStorage);

  @override
  Future<UserEntity> signIn(UserUseCaseParams params) async {
    final user = await _localStorage.get(params.email);
    if (user.contains(AppError.keyNotFound)) {
      throw Exception('Usuário não cadastrado');
    } else {
      final userEntity = UserEntity.fromJson(jsonDecode(user));
      if (userEntity.password == params.password) {
        return userEntity;
      } else {
        throw Exception('Senha incorreta');
      }
    }
  }

  @override
  Future<UserEntity> signUp(UserUseCaseParams params) async {
    final user = await _localStorage.get(params.email);
    if (user.contains(AppError.keyNotFound)) {
      final newUser = UserEntity(
        email: params.email,
        password: params.password,
        name: params.name,
        id: params.id,
      );
      if (await _localStorage.save(params.email, newUser.toJson())) {
        return newUser;
      } else {
        throw Exception('Erro ao salvar usuário');
      }
    } else {
      throw Exception('Usuário já cadastrado');
    }
  }
}
