import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/routes/app_route_enum.dart';

import 'sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  static Future? get navigateTo => Get.toNamed(
        AppRoutes.register.path,
      );

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Container(),
      );
}
