import 'package:auto_size_text/auto_size_text.dart';
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
            tabs: [
              _insertTextTabBar(title: 'Tarefas'),
              _insertTextTabBar(title: 'Pendentes'),
              _insertTextTabBar(title: 'Concluídas'),
            ],
          ),
        ),
      );

  Widget _insertTextTabBar({required String title}) => AutoSizeText(
        title,
        style: const TextStyle(fontSize: 18),
        minFontSize: 14,
      );
}
