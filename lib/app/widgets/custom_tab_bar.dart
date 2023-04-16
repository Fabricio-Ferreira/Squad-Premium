import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.blue.shade900,
              width: 2,
            ),
          ),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blue.shade900,
            indicator: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(30),
            ),
            labelPadding: const EdgeInsets.symmetric(vertical: 4),
            labelStyle: const TextStyle(fontSize: 20),
            unselectedLabelStyle: TextStyle(fontSize: 20, color: Colors.blue.shade900),
            tabs: const [
              Tab(
                text: 'Tarefas',
              ),
              Tab(
                text: 'Pendentes',
              ),
              Tab(
                text: 'Concluídas',
              ),
            ],
          ),
        ),
      );
}
