import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/home/arguments/home_arguments.dart';
import 'package:squad_premium_test/app/pages/home/home_controller.dart';
import 'package:squad_premium_test/app/routes/app_route_enum.dart';
import 'package:squad_premium_test/app/widgets/custom_tab_bar.dart';
import 'package:squad_premium_test/app/widgets/tasks_list_widget.dart';

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
                    onPressed: () => controller.removeAccount(),
                    icon: const Icon(Icons.person_remove_alt_1_outlined),
                  ),
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height * 0.77,
                          child: TabBarView(
                            children: [
                              TasksListWidget(tasksList: controller.tasksList),
                              TasksListWidget(tasksList: controller.tasksListPending),
                              TasksListWidget(tasksList: controller.tasksListDone),
                            ],
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: CustomTabBar(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
