import 'package:flutter/material.dart';

class PainelBotoes extends StatelessWidget {
  final VoidCallback aceitar;
  final VoidCallback excluir;
  const PainelBotoes({required this.aceitar, required this.excluir, Key? key,})
      : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          IconButton(
            onPressed: excluir,
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
          IconButton(
            onPressed: aceitar,
            icon: const Icon(Icons.check),
            color: Colors.green,
          ),
          
        ],
      ),
    );
  }
}
