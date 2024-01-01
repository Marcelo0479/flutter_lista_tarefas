import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController difficultyControler = TextEditingController();
  TextEditingController imageControler = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova tarefa"),
          leading: const SizedBox(),
        ),
        body: Center(
          child: Container(
            width: 375,
            height: 650,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Digite o nome da tarefa';
                        }
                        return null;
                      },
                      controller: nameControler,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(hintText: 'Nome'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value!) ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Digite um número de 1 a 5';
                        }
                        return null;
                      },
                      controller: difficultyControler,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(hintText: 'Dificuldade'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Digite a Url da imagem';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageControler,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(hintText: 'Url da imagem'),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      imageControler.text,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset('images/nophoto.png');
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      TaskInherited.of(widget.taskContext).newTask(
                        nameControler.text,
                        imageControler.text,
                        int.parse(difficultyControler.text),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Salvando nova tarefa')));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Adicionar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
