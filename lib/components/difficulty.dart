import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int levelDifficulty;

  const Difficulty(
      {required this.levelDifficulty,
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 20,
          color: (levelDifficulty >= 1) ? Colors.blue : Colors.blue[200],
        ),
        Icon(
          Icons.star,
          size: 20,
          color: (levelDifficulty >= 2) ? Colors.blue : Colors.blue[200],
        ),
        Icon(
          Icons.star,
          size: 20,
          color: (levelDifficulty >= 3) ? Colors.blue : Colors.blue[200],
        ),
        Icon(
          Icons.star,
          size: 20,
          color: (levelDifficulty >= 4) ? Colors.blue : Colors.blue[200],
        ),
        Icon(
          Icons.star,
          size: 20,
          color: (levelDifficulty >= 5) ? Colors.blue : Colors.blue[200],
        ),
      ],
    );
  }
}
