import 'package:flutter/material.dart';

class TelaApresentacaoDois extends StatelessWidget {
  const TelaApresentacaoDois({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apresentação Dois',
            style: TextStyle(fontWeight: FontWeight.bold)),   
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Segunda tela, como vai funcionar o app',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'apresentacaoTres');
              },
              child: Text('Próximo'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'apresentacaoUm');
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
