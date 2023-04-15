import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/auth/auth_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/params/user_use_case_params.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/sign_in/sign_in_use_case.dart';

class AuthRepositorySpy extends Mock implements AuthRepository {}

void main() {
  late AuthRepository authRepository;
  late SignInUseCase signInUseCase;

  setUpAll(() {
    authRepository = AuthRepositorySpy();
    signInUseCase = SignInUseCase(authRepository);
  });

  tearDownAll(() {
    authRepository = AuthRepositorySpy();
    signInUseCase = SignInUseCase(authRepository);
  });

  test('should sign in', () async {
    const userEntity = UserEntity(id: 1, name: 'name', email: 'email', password: 'password');
    final params = UserUseCaseParams(email: 'email', password: '123', name: 'name');
    when(() => authRepository.signIn(params)).thenAnswer((_) async => const Right(userEntity));

    final result = await signInUseCase.call(params);

    verify(() => authRepository.signIn(params)).called(1);
    expect(result.isRight(), true);
  });

  test('should error on sign in', () async {
    final params = UserUseCaseParams(email: 'email', password: '123', name: 'name');
    when(() => authRepository.signIn(params)).thenAnswer((_) async => throw Exception());

    try {
      await signInUseCase.call(params);
      verify(() => authRepository.signIn(params)).called(1);
    } on Exception catch (e) {
      expect(e, isA<Exception>());
    }
  });
}
