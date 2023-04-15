import 'package:path/path.dart';

abstract class ValidatorHelper {
  static bool hasUppercase(String text) {
    const r = r'[A-Z]';
    return RegExp(r).hasMatch(text);
  }

  static bool hasDigits(String text) {
    const r = r'[0-9]';
    return RegExp(r).hasMatch(text);
  }

  static bool hasLowercase(String text) {
    const r = r'[a-z]';
    return RegExp(r).hasMatch(text);
  }

  static bool hasSpecialCharacters(String text) =>
      text.contains(RegExp(r""".*[!@#$&*^_`{|}~%'()+,-.\/:;<=>?]"""));

  static bool emailIsValid(String text) {
    const r = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+""";
    return RegExp(r).hasMatch(text);
  }

  static bool is2faSizeValid(String text) => text.length == 6;

  static bool isPasswordSizeValid(String text) => text.length >= 6;

  static bool isPasswordSizeValidNewAuth(String text) => text.length >= 8;

  static bool doesPasswordMatch({required String lhsPassword, required String rhsPassword}) =>
      equals(lhsPassword, rhsPassword);

  static bool isPasswordValid(String text) {
    if (countRulesPassword(text) >= 3) {
      return isPasswordSizeValid(text);
    } else {
      return false;
    }
  }

  static bool isPasswordValidNewAuth(String text) {
    if (countRulesPassword(text) >= 3) {
      return isPasswordSizeValidNewAuth(text);
    } else {
      return false;
    }
  }

  static int countRulesPassword(String password) {
    int countRulesPassword = 0;
    if (hasDigits(password)) countRulesPassword++;
    if (hasLowercase(password)) countRulesPassword++;
    if (hasUppercase(password)) countRulesPassword++;
    if (hasSpecialCharacters(password)) countRulesPassword++;

    return countRulesPassword;
  }

  static bool isSsnValid(String ssn) =>
      RegExp(r'^(?!0{3}|6{3}|9[0-9]{2})[0-9]{3}-?(?!0{2})[0-9]{2}-?(?!0{4})[0-9]{4}$')
          .hasMatch(ssn);
}
