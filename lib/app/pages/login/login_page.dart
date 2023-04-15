import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/login/login_controller.dart';
import 'package:squad_premium_test/app/pages/sign_up/sign_up_page.dart';
import 'package:squad_premium_test/app/routes/app_route_enum.dart';
import 'package:squad_premium_test/app/widgets/input_text_field.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  static Future? get navigateTo => Get.toNamed(
        AppRoutes.login.path,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Image(
                    image: AssetImage('images/icon.jpg'),
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Bem Vindo ao Squad Premium',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  InputTextField(
                    label: 'Email',
                    icon: Icons.email_outlined,
                    controller: controller.emailController,
                    focusNode: controller.emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    onChanged: (value) => controller.changeEmail(value),
                    onFieldSubmitted: (_) => controller.passwordFocusNode.requestFocus(),
                    onEditingComplete: TextInput.finishAutofillContext,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => InputTextField(
                      label: 'Password',
                      icon: Icons.lock_person_outlined,
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const [AutofillHints.password],
                      onChanged: (value) => controller.changePassword(value),
                      onEditingComplete: TextInput.finishAutofillContext,
                      obscureText: !controller.passwordIsVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.passwordIsVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () => controller.changePasswordIsVisible(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => ElevatedButton(
                      onPressed: controller.isFormValid ? () => controller.login() : null,
                      style: controller.isFormValid
                          ? ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
                            )
                          : null,
                      child: const Text('LOGIN'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => SignUpPage.navigateTo,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
                    ),
                    child: const Text('CADASTRAR'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
