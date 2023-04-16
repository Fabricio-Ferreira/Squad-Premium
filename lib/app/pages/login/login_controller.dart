import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/helpers/validator_helper.dart';
import 'package:squad_premium_test/app/mixin/alert_mixin.dart';
import 'package:squad_premium_test/app/pages/home/arguments/home_arguments.dart';
import 'package:squad_premium_test/app/pages/home/home_page.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/params/user_use_case_params.dart';
import 'package:squad_premium_test/core/domain/use_cases/auth/sign_in/sign_in_use_case.dart';
import 'package:squad_premium_test/core/error/failure.dart';

class LoginController extends GetxController with AlertMixin {
  final SignInUseCase _signInUseCase;

  LoginController(this._signInUseCase);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _emailIsValid = false.obs;
  final _passwordIsValid = false.obs;
  final _passwordIsVisible = false.obs;

  bool get emailIsValid => _emailIsValid.value;
  bool get passwordIsValid => _passwordIsValid.value;
  bool get passwordIsVisible => _passwordIsVisible.value;
  bool get isFormValid => emailIsValid && passwordIsValid;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;

  void changeEmail(String value) => _emailIsValid.value = ValidatorHelper.emailIsValid(value);

  void changePassword(String value) =>
      _passwordIsValid.value = ValidatorHelper.isPasswordSizeValid(value) &&
          ValidatorHelper.hasDigits(value) &&
          ValidatorHelper.hasSpecialCharacters(value) &&
          ValidatorHelper.hasUppercase(value) &&
          ValidatorHelper.hasLowercase(value);

  void changePasswordIsVisible() => _passwordIsVisible.toggle();

  Future<void> login() async {
    if (isFormValid) {
      final result = await _signInUseCase(
        UserUseCaseParams(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );

      result.fold(
        _handleError,
        (user) => HomePage.navigateWith(arguments: HomeArguments(nameUser: user.name)),
      );
    }
  }

  void _handleError(Failure failure) => showSnackBar(message: failure.message, isError: true);
}
