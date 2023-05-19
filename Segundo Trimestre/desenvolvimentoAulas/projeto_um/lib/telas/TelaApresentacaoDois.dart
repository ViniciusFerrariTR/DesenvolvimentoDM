import 'package:flutter/material.dart';

class TelaApresentacaoUm extends StatelessWidget {
  const TelaApresentacaoUm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apresentação Um',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
