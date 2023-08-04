import 'package:flutter/material.dart';

class BotaoExcluirAceito extends StatelessWidget {
  final VoidCallback excluir;
  const BotaoExcluirAceito({required this.excluir, Key? key})
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
        ],
      ),
    );
  }
}
