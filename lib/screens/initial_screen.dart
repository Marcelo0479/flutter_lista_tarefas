import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/data/task_inherited.dart';
import 'package:lista_de_tarefas/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de tarefas',
        ),
        leading: const SizedBox(),
      ),
      body: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 80)
          ,children: TaskInherited.of(context).tasklist),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                        taskContext: context,
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
