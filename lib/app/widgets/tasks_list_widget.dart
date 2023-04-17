// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/home/home_controller.dart';

import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';

class TasksListWidget extends GetView<HomeController> {
  final List<TaskEntity> tasksList;

  const TasksListWidget({
    required this.tasksList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Container(
          padding: const EdgeInsets.only(top: 60),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => const Divider(height: 2),
            itemCount: tasksList.length,
            itemBuilder: (context, index) {
              final task = tasksList[index];
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.green,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.task_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    controller.removeTask(task);
                  } else {
                    controller.updateTask(task);
                  }
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    task.title,
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    task.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: task.isDone,
                        onChanged: (value) => controller.updateTask(task),
                      ),
                      IconButton(
                        onPressed: () => controller.removeTask(task),
                        icon: const Icon(
                          Icons.highlight_remove_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => controller.navigateToCreateTask(task),
                ),
              );
            },
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<TaskEntity>('tasksList', tasksList));
  }
}
