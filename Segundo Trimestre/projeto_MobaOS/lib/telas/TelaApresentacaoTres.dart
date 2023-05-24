import 'package:flutter/material.dart';

class TelaApresentacaoDois extends StatelessWidget {
  const TelaApresentacaoDois({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
