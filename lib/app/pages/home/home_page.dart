import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/home/arguments/home_arguments.dart';
import 'package:squad_premium_test/app/pages/home/home_controller.dart';
import 'package:squad_premium_test/app/routes/app_route_enum.dart';
import 'package:squad_premium_test/app/widgets/custom_tab_bar.dart';

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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height,
                          child: TabBarView(
                            children: [
                              Obx(
                                () => Container(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    separatorBuilder: (context, index) => const Divider(),
                                    itemCount: controller.tasksList.length,
                                    itemBuilder: (context, index) {
                                      final task = controller.tasksList[index];
                                      return ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                        title: Text(
                                          task.title,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          task.description,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        trailing: Checkbox(
                                          value: task.isDone,
                                          onChanged: (value) => controller.updateTask(task),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Obx(
                                () => Container(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    separatorBuilder: (context, index) => const Divider(),
                                    itemCount: controller.tasksListPending.length,
                                    itemBuilder: (context, index) {
                                      final task = controller.tasksListPending[index];
                                      return ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                        title: Text(
                                          task.title,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          task.description,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        trailing: Checkbox(
                                          value: task.isDone,
                                          onChanged: (value) => controller.updateTask(task),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Obx(
                                () => Container(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    separatorBuilder: (context, index) => const Divider(),
                                    itemCount: controller.tasksListDone.length,
                                    itemBuilder: (context, index) {
                                      final task = controller.tasksListDone[index];
                                      return ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                        title: Text(
                                          task.title,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          task.description,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        trailing: Checkbox(
                                          value: task.isDone,
                                          onChanged: (value) => controller.updateTask(task),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.all(30),
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
