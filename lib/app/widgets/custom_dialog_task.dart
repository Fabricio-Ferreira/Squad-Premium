// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:squad_premium_test/app/pages/home/home_controller.dart';
import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';

class CustomDialogTask extends GetWidget<HomeController> {
  final bool? isUpdate;
  final TaskEntity? task;

  const CustomDialogTask({
    this.isUpdate,
    this.task,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Criar Tarefa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller.titleTaskController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Título',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller.descriptionTaskController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descrição',
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => CheckboxListTile(
                    value: controller.check.value,
                    onChanged: (value) {
                      controller.check.toggle();
                      controller.update();
                    },
                    activeColor: Colors.blue.shade900,
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                    title: const Text('Concluída', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    isUpdate == true
                        ? controller.updateTask(task!, isUpdate: true)
                        : controller.addTask();
                    Get.back();
                  },
                  child: Text(isUpdate == true ? 'EDITAR TAREFA' : 'CRIAR TAREFA'),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isUpdate', isUpdate));
    properties.add(DiagnosticsProperty<TaskEntity?>('task', task));
  }
}
