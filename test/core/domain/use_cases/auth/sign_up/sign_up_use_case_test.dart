import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/auth/auth_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/params/user_use_case_params.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/sign_up/sign_up_use_case.dart';
import 'package:squad_premium_test/core/error/failure.dart';

class AuthRepositorySpy extends Mock implements AuthRepository {}

void main() {
  late AuthRepository authRepository;
  late SignUpUseCase signUpUseCase;

  setUpAll(() {
    authRepository = AuthRepositorySpy();
    signUpUseCase = SignUpUseCase(authRepository);
  });

  tearDownAll(() {
    authRepository = AuthRepositorySpy();
    signUpUseCase = SignUpUseCase(authRepository);
  });

  group('signUpUseCase', () {
    test('should be a subclass of SignUpUseCase', () {
      expect(signUpUseCase, isA<SignUpUseCase>());
    });

    test('should return a UserEntity', () async {
      const userEntity =
          UserEntity(id: 1, name: 'name', email: 'email', password: 'password', hasTasks: false);
      final params = UserUseCaseParams(email: 'email', password: '123', name: 'name');
      when(() => authRepository.signUp(params)).thenAnswer((_) async => const Right(userEntity));

      final result = await signUpUseCase.call(params);

      verify(() => authRepository.signUp(params)).called(1);
      expect(result.isRight(), true);
      expect(result.fold(id, id), isA<UserEntity>());
    });

    test('should return a Failure', () async {
      final params = UserUseCaseParams(email: 'email', password: '123', name: 'name');
      when(() => authRepository.signUp(params))
          .thenAnswer((_) async => const Left(BadRequestFailure(message: 'error')));

      final result = await signUpUseCase.call(params);

      verify(() => authRepository.signUp(params)).called(1);
      expect(result.isLeft(), true);
      expect(result.fold(id, id), isA<Failure>());
    });
  });
}
