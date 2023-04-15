import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/home/arguments/home_arguments.dart';
import 'package:squad_premium_test/app/utils/try_cast.dart';

class HomeController extends GetxController {
  late HomeArguments _arguments;
  HomeArguments get arguments => _arguments;
  final _nameUser = ''.obs;
  String get nameUser => _nameUser.value;

  void _getArguments() {
    final arguments = tryCast<HomeArguments>(Get.arguments);
    if (arguments != null) {
      _arguments = arguments;
      _nameUser.value = _arguments.nameUser;
    }
  }

  void onFocusGained() => _getArguments();

  void logout() {}

  void navigateToCreateTask() {}
}
