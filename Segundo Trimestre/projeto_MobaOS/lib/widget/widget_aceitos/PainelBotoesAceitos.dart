import 'package:flutter/material.dart';

class PainelBotoesAceitos extends StatelessWidget {
  final VoidCallback concluirAceitos;
  const PainelBotoesAceitos({required this.concluirAceitos, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          IconButton(
            onPressed: concluirAceitos,
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
        
        ],
      ),
    );
  }
}
