import 'package:flutter/material.dart';
import 'cadastro.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Color.fromRGBO(79, 3, 107, 0.957),
      ),
      body: ElevatedButton(
          child: const Text('Cadastro'),
          onPressed: () {
            Route rota = MaterialPageRoute(builder: (context) => Cadastro());
            Navigator.pushNamed(context, 'cadastro');
          }),
    );
  }
}
