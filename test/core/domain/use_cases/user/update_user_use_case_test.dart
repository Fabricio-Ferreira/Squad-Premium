import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/user/user_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/user/params/user_params.dart';
import 'package:squad_premium_test/core/domain/use_cases/user/update_user_use_case.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  late UserRepository userRepository;
  late UpdateUserUseCase updateUserUseCase;

  setUpAll(() {
    userRepository = UserRepositoryMock();
    updateUserUseCase = UpdateUserUseCase(userRepository);
  });

  tearDownAll(() {
    userRepository = UserRepositoryMock();
    updateUserUseCase = UpdateUserUseCase(userRepository);
  });

  group('UpdateUserUseCase', () {
    const email = 'email';
    const hasTasks = true;

    final params = UserParams(userEmail: email, hasTasks: hasTasks);

    const userEntity =
        UserEntity(id: 1, name: 'name', email: 'email', password: 'password', hasTasks: false);

    test('should update user', () async {
      when(() => userRepository.updateUser(email, hasTasks: hasTasks))
          .thenAnswer((_) async => const Right(userEntity));

      final result = await updateUserUseCase.call(params);

      verify(() => userRepository.updateUser(email, hasTasks: hasTasks)).called(1);
      expect(result.isRight(), true);
    });

    test('should error on update user', () async {
      const email = 'email';
      when(() => userRepository.updateUser(email, hasTasks: hasTasks))
          .thenAnswer((_) async => throw Exception());

      try {
        await updateUserUseCase.call(params);
        verify(() => userRepository.updateUser(email, hasTasks: hasTasks)).called(1);
      } on Exception catch (e) {
        expect(e, isA<Exception>());
      }
    });
    test('should be a subclass of UpdateUserUseCase', () {
      expect(updateUserUseCase, isA<UpdateUserUseCase>());
    });
  });
}
