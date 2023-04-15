import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/home/arguments/home_arguments.dart';
import 'package:squad_premium_test/app/pages/home/home_controller.dart';
import 'package:squad_premium_test/app/routes/app_route_enum.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  static Future? navigateWith({required HomeArguments? arguments}) => Get.offAllNamed(
        AppRoutes.home.path,
        arguments: arguments,
      );

  @override
  Widget build(BuildContext context) => FocusDetector(
        onFocusGained: () => controller.onFocusGained(),
        child: Obx(
          () => SafeArea(
            top: false,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue.shade900,
                title: Text('Olá, ${controller.nameUser}!'),
                actions: [
                  IconButton(
                    onPressed: () => controller.logout(),
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Colors.blue.shade900,
                onPressed: () => controller.navigateToCreateTask(),
                label: const Text(
                  'Nova Tarefa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                icon: const Icon(Icons.add_outlined),
              ),
              body: Container(
                height: double.infinity,
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Chip(
                        label: Text('Etiqueta'),
                        backgroundColor: Colors.blue,
                        labelStyle: TextStyle(color: Colors.white),
                        shape: StadiumBorder(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
