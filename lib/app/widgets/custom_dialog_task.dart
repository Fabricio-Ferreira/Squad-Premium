import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/home/home_controller.dart';

class CustomDialogTask extends GetWidget<HomeController> {
  const CustomDialogTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
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
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Concluída'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.addTask();
                  Get.back();
                },
                child: const Text('CRIAR TAREFA'),
              ),
            ],
          ),
        ),
      );
}
