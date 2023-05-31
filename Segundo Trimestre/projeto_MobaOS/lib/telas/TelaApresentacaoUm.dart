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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Primeira tela, como vai funcionar o app',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'apresentacaoDois');
              },
              child: Text('Próximo'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'orcamentosLista');
              },
              child: Text('Finalizar'),
            ),
          ],
        ),
      ),
    );
  }
}
