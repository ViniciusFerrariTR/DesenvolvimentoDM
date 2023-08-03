import 'package:flutter/material.dart';

class BotaoAdicionar extends StatelessWidget {
  final VoidCallback acao;
  const BotaoAdicionar({required this.acao, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => acao(),
      tooltip: 'Adicionar Novo Orçamento',
      child: const Icon(Icons.add),
    );
  }
}
