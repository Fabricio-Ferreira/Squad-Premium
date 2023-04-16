// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:squad_premium_test/core/domain/entity/task/task_entity.dart';

class TasksListWidget extends StatelessWidget {
  final VoidCallback onChanged;
  final List<TaskEntity> tasksList;

  const TasksListWidget({
    required this.tasksList,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 100),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => const Divider(),
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            final task = tasksList[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              title: Text(
                task.title,
                style:
                    const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
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
                onChanged: (value) => onChanged,
              ),
            );
          },
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<TaskEntity>('tasksList', tasksList));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onChanged', onChanged));
  }
}
