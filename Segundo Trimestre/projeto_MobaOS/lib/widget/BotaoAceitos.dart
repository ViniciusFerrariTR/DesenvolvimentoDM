import 'package:flutter/material.dart';

class BotaoAceitos extends StatelessWidget {
  final VoidCallback acao;
  const BotaoAceitos({required this.acao, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => acao(),
      tooltip: 'Orcamentos Aceitos',
      child: const Icon(Icons.check),
    );
  }
}
