import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> tasklist = [
    Task('Aprender Flutter', 'images/dash.png', 5),
    Task('Andar de Bike', 'images/bike.webp', 2),
    Task('Meditar', 'images/meditar.jpeg', 4),
    Task('Ler', 'images/livro.jpg', 3),
    Task('Jogar', 'images/jogar.jpg', 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    tasklist.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.tasklist.length != tasklist.length;
  }
}
