import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/routes/app_route_enum.dart';
import 'package:squad_premium_test/app/widgets/input_text_field.dart';

import 'sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  static Future? get navigateTo => Get.toNamed(
        AppRoutes.register.path,
      );

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text('CADASTRO'),
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue.shade900,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage('images/icon.jpg'),
                  height: 400,
                  fit: BoxFit.cover,
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
                ).paddingSymmetric(horizontal: 20),
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
                  ).paddingSymmetric(horizontal: 20),
                ),
                const SizedBox(height: 20),
                InputTextField(
                  label: 'Nome',
                  icon: Icons.person_outline_outlined,
                  controller: controller.nameController,
                  focusNode: controller.nameFocusNode,
                  keyboardType: TextInputType.name,
                  autofillHints: const [AutofillHints.name],
                  onChanged: (value) => controller.changeName(value),
                  onEditingComplete: TextInput.finishAutofillContext,
                ).paddingSymmetric(horizontal: 20),
                const SizedBox(height: 20),
                Obx(
                  () => ElevatedButton(
                    onPressed: controller.isFormValid ? () => controller.signUp() : null,
                    style: controller.isFormValid
                        ? ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
                          )
                        : null,
                    child: const Text('CADASTRAR'),
                  ).paddingSymmetric(horizontal: 20),
                ),
              ],
            ),
          ),
        ),
      );
}
