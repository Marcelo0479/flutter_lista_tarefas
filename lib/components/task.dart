import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {super.key});

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: (assetOrNetwork())
                            ? Image.asset(
                                widget.foto,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              )),
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nome,
                          style: const TextStyle(fontSize: 24),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Difficulty(
                          levelDifficulty: widget.dificuldade,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 52,
                    width: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.nivel++;
                        });
                      },
                      child: const Column(
                        children: [Icon(Icons.arrow_drop_up), Text('UP')],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      value: widget.nivel / 10 / widget.dificuldade,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nível: ${widget.nivel}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
