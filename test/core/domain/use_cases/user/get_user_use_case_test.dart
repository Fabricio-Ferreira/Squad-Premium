import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/domain/entity/user/user_entity.dart';
import 'package:squad_premium_test/core/domain/repositories/user/user_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/user/get_information_user_use_case.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  late UserRepository userRepository;
  late GetUserUseCase getUserUseCase;

  setUpAll(() {
    userRepository = UserRepositoryMock();
    getUserUseCase = GetUserUseCase(userRepository);
  });

  tearDownAll(() {
    userRepository = UserRepositoryMock();
    getUserUseCase = GetUserUseCase(userRepository);
  });

  group('GetUserUseCase', () {
    const userEntity =
        UserEntity(id: 1, name: 'name', email: 'email', password: 'password', hasTasks: false);

    test('should be a subclass of GetUserUseCase', () {
      expect(getUserUseCase, isA<GetUserUseCase>());
    });

    test('should return a UserEntity', () async {
      const email = 'email';
      when(() => userRepository.getUser(email)).thenAnswer((_) async => const Right(userEntity));

      final result = await getUserUseCase.call(email);

      verify(() => userRepository.getUser(email)).called(1);
      expect(result, isA<Right>());
      expect(result.getOrElse(() => userEntity), isA<UserEntity>());
    });

    test('should return a Exception', () async {
      const email = 'email';
      when(() => userRepository.getUser(email)).thenAnswer((_) async => throw Exception());

      try {
        await getUserUseCase.call(email);
        verify(() => userRepository.getUser(email)).called(1);
      } on Exception catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
}
