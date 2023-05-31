import 'package:flutter/material.dart';

class TelaApresentacaoTres extends StatelessWidget {
  const TelaApresentacaoTres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apresentação Tres',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Terceira Tela, Bom proveito',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'orcamentosLista');
              },
              child: Text('Finalizar'),
            ),
          ],
        ),
      ),
    );
  }
}
