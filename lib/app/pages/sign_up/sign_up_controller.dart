import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/helpers/validator_helper.dart';
import 'package:squad_premium_test/app/routes/app_route_enum.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/params/user_use_case_params.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/sign_up/sign_up_use_case.dart';

class SignUpController extends GetxController {
  final SignUpUseCase _signUpUseCase;
  SignUpController(this._signUpUseCase);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _emailIsValid = false.obs;
  final _passwordIsValid = false.obs;
  final _passwordIsVisible = false.obs;

  bool get emailIsValid => _emailIsValid.value;
  bool get passwordIsValid => _passwordIsValid.value;
  bool get passwordIsVisible => _passwordIsVisible.value;
  bool get isFormValid => emailIsValid && passwordIsValid && _nameController.text.isNotEmpty;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get nameController => _nameController;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get nameFocusNode => _nameFocusNode;

  void changeEmail(String value) => _emailIsValid.value = ValidatorHelper.emailIsValid(value);

  void changePassword(String value) =>
      _passwordIsValid.value = ValidatorHelper.isPasswordSizeValid(value) &&
          ValidatorHelper.hasDigits(value) &&
          ValidatorHelper.hasSpecialCharacters(value) &&
          ValidatorHelper.hasUppercase(value) &&
          ValidatorHelper.hasLowercase(value);

  void changePasswordIsVisible() => _passwordIsVisible.toggle();

  void changeName(String text) {}

  Future<void> signUp() async {
    if (isFormValid) {
      final result = await _signUpUseCase(
        UserUseCaseParams(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
        ),
      );

      result.fold(
        (failure) => Get.snackbar(
          'Erro',
          failure.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          messageText: Text(
            failure.message,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        (success) => Get.offAllNamed(AppRoutes.home.path),
      );
    }
  }
}
