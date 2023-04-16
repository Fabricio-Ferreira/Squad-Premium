import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:squad_premium_test/core/domain/repositories/user/user_repository.dart';
import 'package:squad_premium_test/core/domain/use_cases/app/remove_account_use_case.dart';
import 'package:squad_premium_test/core/domain/use_cases/base/base_use_case.dart';
import 'package:test/test.dart';

class UserRepositorySpy extends Mock implements UserRepository {}

void main() {
  late UserRepository userRepository;
  late RemoveAccountUseCase removeAccountUseCase;

  setUpAll(() {
    userRepository = UserRepositorySpy();
    removeAccountUseCase = RemoveAccountUseCase(userRepository);
  });

  tearDownAll(() {
    userRepository = UserRepositorySpy();
    removeAccountUseCase = RemoveAccountUseCase(userRepository);
  });

  group('RemoveAccountUseCase', () {
    test('should be a subclass of RemoveAccountUseCase', () {
      expect(removeAccountUseCase, isA<RemoveAccountUseCase>());
    });

    test('should be a subclass of BaseUseCase', () {
      expect(removeAccountUseCase, isA<BaseUseCase>());
    });

    test('should remove account', () async {
      const email = 'email';
      when(() => userRepository.removeAccount(email)).thenAnswer((_) async => const Right(true));

      final result = await removeAccountUseCase.call(email);

      verify(() => userRepository.removeAccount(email)).called(1);
      expect(result.isRight(), true);
    });

    test('should error on remove account', () async {
      const email = 'email';
      when(() => userRepository.removeAccount(email)).thenAnswer((_) async => throw Exception());

      try {
        await removeAccountUseCase.call(email);
        verify(() => userRepository.removeAccount(email)).called(1);
      } on Exception catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
}
